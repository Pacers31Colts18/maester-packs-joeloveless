# Pester tests of the helpers in shared/helpers against faked Graph responses. Run: Invoke-Pester ./tests
# Without a tenant the engine skips every pack test (ServiceNotConnected) and never runs the helpers, so this is what
# proves the decision logic.

BeforeAll {
    foreach ($helper in Get-ChildItem -Path (Join-Path $PSScriptRoot '../../shared/helpers') -Filter '*.ps1') { . $helper.FullName }

    # Stand-ins for the Maester commands the helpers call.
    function Invoke-MtGraphRequest {
        param([string] $RelativeUri, [string] $ApiVersion, [string[]] $Select)
        $script:GraphCalls.Add($RelativeUri)
        if ($script:GraphError) { throw $script:GraphError }
        if (-not $script:Graph.ContainsKey($RelativeUri)) { throw "Unexpected Graph call: $RelativeUri" }
        $script:Graph[$RelativeUri]
    }
    function Add-MtTestResultDetail {
        param([string] $Result, [string] $SkippedBecause)
        $script:Detail = [pscustomobject]@{ Result = $Result; SkippedBecause = $SkippedBecause }
    }
    function Get-MtSetting {
        param([string] $Name, $Default)
        if ($script:Settings.ContainsKey($Name)) { return $script:Settings[$Name] }
        $Default
    }

    $script:SettingId = 'device_vendor_msft_policy_config_abovelock_allowcortanaabovelock'
    $script:Block = "$($script:SettingId)_0"
    $script:Allow = "$($script:SettingId)_1"

    function New-FakePolicy([string] $Id, [string] $Name, [string] $Value, [string[]] $Targets = @('AllDevices'), [hashtable] $Children = @{}) {
        $base = "deviceManagement/configurationPolicies('$Id')"
        # Children as the settings catalog nests them under a choice: SettingDefinitionId = value.
        $childInstances = @(foreach ($childId in $Children.Keys) {
                [pscustomobject]@{
                    '@odata.type'       = '#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance'
                    settingDefinitionId = $childId
                    choiceSettingValue  = [pscustomobject]@{ value = $Children[$childId]; children = @() }
                }
            })
        $script:Graph["$base/settings"] = @([pscustomobject]@{
                settingInstance = [pscustomobject]@{
                    '@odata.type'       = '#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance'
                    settingDefinitionId = $script:SettingId
                    choiceSettingValue  = [pscustomobject]@{ value = $Value; children = $childInstances }
                }
            })
        $script:Graph["$base/assignments"] = @(foreach ($t in $Targets) {
                $type = if ($t -eq 'AllDevices') { '#microsoft.graph.allDevicesAssignmentTarget' } else { '#microsoft.graph.groupAssignmentTarget' }
                [pscustomobject]@{ target = [pscustomobject]@{ '@odata.type' = $type; groupId = $t } }
            })
        [pscustomobject]@{ id = $Id; name = $Name; platforms = 'windows10' }
    }

    function Invoke-CortanaTest([hashtable] $Extra = @{}) {
        $script:Detail = $null
        Test-JlIntuneSetting -Source settingsCatalog -Platform windows10 -SettingDefinitionId $script:SettingId -Operator eq -Expected $script:Block @Extra
    }
}

Describe 'JlIntune helpers' {
    BeforeEach {
        $script:Graph = @{}
        $script:GraphCalls = [System.Collections.Generic.List[string]]::new()
        $script:GraphError = $null
        $script:Settings = @{}
        $script:JlIntuneGroupNames = @{ 'g1' = 'W11 Devices' }
    }

    Describe 'Test-JlIntuneValue' {
        It '<Operator> <Expected> against <Actual> is <Result>' -ForEach @(
            @{ Actual = @('a'); Operator = 'eq'; Expected = 'A'; Result = $true }
            @{ Actual = @('a', 'b'); Operator = 'eq'; Expected = 'a'; Result = $false }
            @{ Actual = @(); Operator = 'eq'; Expected = 'a'; Result = $false }
            @{ Actual = @('b'); Operator = 'ne'; Expected = 'a'; Result = $true }
            @{ Actual = @('15'); Operator = 'ge'; Expected = 14; Result = $true }
            @{ Actual = @('13'); Operator = 'ge'; Expected = 14; Result = $false }
            @{ Actual = @('x'); Operator = 'lt'; Expected = 5; Result = $false }
            @{ Actual = @('a', 'b'); Operator = 'in'; Expected = @('a', 'b', 'c'); Result = $true }
            @{ Actual = @('a', 'd'); Operator = 'in'; Expected = @('a', 'b'); Result = $false }
            @{ Actual = @('a'); Operator = 'notIn'; Expected = @('b'); Result = $true }
            @{ Actual = @('a', 'b', 'c'); Operator = 'contains'; Expected = @('a', 'c'); Result = $true }
            @{ Actual = @('a'); Operator = 'contains'; Expected = @('a', 'c'); Result = $false }
            @{ Actual = @('abc'); Operator = 'match'; Expected = '^a'; Result = $true }
            @{ Actual = @('x'); Operator = 'exists'; Expected = $null; Result = $true }
            @{ Actual = @(); Operator = 'exists'; Expected = $null; Result = $false }
        ) {
            Test-JlIntuneValue -Actual $Actual -Operator $Operator -Expected $Expected | Should -Be $Result
        }

        It 'throws on a non-numeric expected value for a numeric operator' {
            { Test-JlIntuneValue -Actual @('1') -Operator gt -Expected 'abc' } | Should -Throw '*numeric*'
        }
    }

    Describe 'ConvertTo-JlIntuneSettingList' {
        It 'flattens group settings and their children' {
            $instance = [pscustomobject]@{
                '@odata.type'       = '#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance'
                settingDefinitionId = 'parent'
                groupSettingCollectionValue = @([pscustomobject]@{
                        children = @([pscustomobject]@{
                                '@odata.type'       = '#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance'
                                settingDefinitionId = 'child'
                                simpleSettingValue  = [pscustomobject]@{ value = 30 }
                            })
                    })
            }
            $list = @(ConvertTo-JlIntuneSettingList -Instance $instance)
            $list.Id | Should -Be 'parent', 'child'
            $list[0].IsGroup | Should -BeTrue
            $list[1].Values | Should -Be 30
        }
    }

    Describe 'Test-JlIntuneSetting' {
        It 'passes when an assigned policy blocks it and none conflicts' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block)
            Invoke-CortanaTest | Should -BeTrue
            $script:Detail.Result | Should -Match 'Well done'
            $script:Detail.Result | Should -Match '\| W11-CIS-L1 \| .+ \| All devices \| Yes \|'
        }

        It 'fails when no policy configures it' {
            $script:Graph['deviceManagement/configurationPolicies'] = @()
            Invoke-CortanaTest | Should -BeFalse
            $script:Detail.Result | Should -Match 'No settingsCatalog policy in scope configures this setting'
        }

        It 'fails on a conflicting assigned policy, and passes with AllowConflicts' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(
                New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block
                New-FakePolicy 'p2' 'Legacy' $script:Allow @('g1')
            )
            Invoke-CortanaTest | Should -BeFalse
            $script:Detail.Result | Should -Match '1 assigned policy/policies set a conflicting value'
            $script:Detail.Result | Should -Match 'W11 Devices'
            Invoke-CortanaTest @{ AllowConflicts = $true } | Should -BeTrue
        }

        It 'does not count an unassigned policy unless IncludeUnassigned' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'Draft' $script:Block @())
            Invoke-CortanaTest | Should -BeFalse
            $script:Detail.Result | Should -Match 'not counted: unassigned'
            Invoke-CortanaTest @{ IncludeUnassigned = $true } | Should -BeTrue
        }

        It 'ignores policies for other platforms' {
            $mac = New-FakePolicy 'p1' 'Mac' $script:Block
            $mac.platforms = 'macOS'
            $script:Graph['deviceManagement/configurationPolicies'] = @($mac)
            Invoke-CortanaTest | Should -BeFalse
        }

        It 'uses the PolicyNameFilter parameter before the JLIntune.PolicyNameFilter setting' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(
                New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block
                New-FakePolicy 'p2' 'Legacy' $script:Allow
            )
            $script:Settings['JLIntune.PolicyNameFilter'] = 'W11-CIS-*'
            Invoke-CortanaTest | Should -BeTrue
            $script:Detail.Result | Should -Match 'in policies named `W11-CIS-\*`'
            Invoke-CortanaTest @{ PolicyNameFilter = 'Legacy' } | Should -BeFalse
        }

        It 'skips as NotAuthorized on a 403 and rethrows any other error' {
            $script:GraphError = [System.Exception]::new('Response status code does not indicate success: 403 (Forbidden).')
            Invoke-CortanaTest | Should -BeNullOrEmpty
            $script:Detail.SkippedBecause | Should -Be 'NotAuthorized'
            $script:GraphError = [System.Exception]::new('Response status code does not indicate success: 400 (BadRequest).')
            { Invoke-CortanaTest } | Should -Throw '*400*'
        }

        It 'takes Expected as a one-element string array, as the test parameter passes it' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block)
            [string[]] $expected = $script:Block
            Test-JlIntuneSetting -Source settingsCatalog -Platform windows10 -SettingDefinitionId $script:SettingId -Operator eq -Expected $expected | Should -BeTrue
            $script:Detail.Result | Should -Match "eq $($script:Block)"
        }

        It 'returns exactly one boolean' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block)
            $out = @(Invoke-CortanaTest)
            $out.Count | Should -Be 1
            $out[0] | Should -BeOfType [bool]
        }

        It 'with child settings, passes only when the setting and every child match in the same policy' {
            $child = @{ ChildSettingDefinitionId = 'smb_driver'; ChildExpected = 'smb_driver_4' }
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ smb_driver = 'smb_driver_4' })
            Invoke-CortanaTest $child | Should -BeTrue
            $script:Detail.Result | Should -Match 'with `smb_driver` eq smb_driver_4 in the same policy'
            # The value cell is escaped for Markdown (underscores too).
            $script:Detail.Result | Should -Match ([regex]::Escape("| $($script:Block -replace '_', '\_'); smb\_driver\_4 |"))

            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ smb_driver = 'smb_driver_2' })
            Invoke-CortanaTest $child | Should -BeFalse

            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block)
            Invoke-CortanaTest $child | Should -BeFalse
            $script:Detail.Result | Should -Match 'smb_driver: \(not set\)'
        }

        It 'escapes Markdown in the configured value, so \\*\NETLOGON shows as written' {
            $children = @{ ChildSettingDefinitionId = 'path'; ChildExpected = '\\*\NETLOGON|\\*\SYSVOL'; ChildOperator = 'contains' }
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ path = '\\*\NETLOGON' })
            Invoke-CortanaTest $children | Should -BeFalse
            $script:Detail.Result | Should -Match ([regex]::Escape('; \\\\\*\\NETLOGON |'))
            ConvertTo-JlIntuneCell -Text 'a|b' | Should -Be 'a\|b'
        }

        It 'does not take a child setting from another policy' {
            $script:Graph['deviceManagement/configurationPolicies'] = @(
                New-FakePolicy 'p1' 'Parent only' $script:Block
                New-FakePolicy 'p2' 'Other' $script:Block -Children @{ smb_driver = 'smb_driver_2' }
            )
            Invoke-CortanaTest @{ ChildSettingDefinitionId = 'smb_driver'; ChildExpected = 'smb_driver_4' } | Should -BeFalse
        }

        It 'refuses child ids and values that do not pair up' {
            { Invoke-CortanaTest @{ ChildSettingDefinitionId = 'a', 'b'; ChildExpected = 'a_1' } } | Should -Throw '*in pairs*'
            { Invoke-CortanaTest @{ ChildSettingDefinitionId = 'a', 'b'; ChildExpected = 'a_1', 'b_1'; ChildOperator = 'ge' } } | Should -Throw '*one operator per child*'
        }

        It 'compares each child with its own ChildOperator: ge, in (values split by |) and exists' {
            $children = @{ ChildSettingDefinitionId = 'size', 'protocol', 'path'; ChildExpected = '32768', 'protocol_0|protocol_1', ''; ChildOperator = 'ge', 'in', 'exists' }
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ size = '65536'; protocol = 'protocol_1'; path = 'C:\any\path.log' })
            Invoke-CortanaTest $children | Should -BeTrue
            $script:Detail.Result | Should -Match 'with `size` ge 32768, with `protocol` in protocol_0, protocol_1, with `path` is configured in the same policy'

            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ size = '16384'; protocol = 'protocol_1'; path = 'C:\any\path.log' })
            Invoke-CortanaTest $children | Should -BeFalse
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ size = '65536'; protocol = 'protocol_2'; path = 'C:\any\path.log' })
            Invoke-CortanaTest $children | Should -BeFalse
            $script:Graph['deviceManagement/configurationPolicies'] = @(New-FakePolicy 'p1' 'W11-CIS-L1' $script:Block -Children @{ size = '65536'; protocol = 'protocol_1' })
            Invoke-CortanaTest $children | Should -BeFalse
        }

        It 'with several settings, passes only when each passes on its own, with one Expected for all or one per setting' {
            # As Energy Saver: the same timer under Desktop Power, Laptop Battery Power and Laptop Power.
            $timers = 'desktop_timer', 'battery_timer', 'portable_timer'
            $setPolicy = {
                param([hashtable] $Values)
                $script:Graph["deviceManagement/configurationPolicies('m1')/settings"] = @(foreach ($id in $Values.Keys) {
                        [pscustomobject]@{ settingInstance = [pscustomobject]@{
                                '@odata.type'       = '#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance'
                                settingDefinitionId = $id
                                simpleSettingValue  = [pscustomobject]@{ value = $Values[$id] }
                            } }
                    })
                $script:Graph["deviceManagement/configurationPolicies('m1')/assignments"] = @([pscustomobject]@{ target = [pscustomobject]@{ '@odata.type' = '#microsoft.graph.allDevicesAssignmentTarget' } })
                $script:Graph['deviceManagement/configurationPolicies'] = @([pscustomobject]@{ id = 'm1'; name = 'MAC-CIS-L1'; platforms = 'macOS' })
            }
            $test = { param($Expected, $Operator = 'match') Test-JlIntuneSetting -Source settingsCatalog -Platform macOS -SettingDefinitionId $timers -Operator $Operator -Expected $Expected }

            & $setPolicy @{ desktop_timer = 10; battery_timer = 5; portable_timer = 1 }
            & $test '^([1-9]|10)$' | Should -BeTrue
            $script:Detail.Result | Should -Match 'Well done. Every setting'
            $script:Detail.Result | Should -Match '\| battery\\_timer \| MAC-CIS-L1 \| 5 \| All devices \| Yes \|'

            & $setPolicy @{ desktop_timer = 10; battery_timer = 0; portable_timer = 1 }
            & $test '^([1-9]|10)$' | Should -BeFalse
            $script:Detail.Result | Should -Match '1 of 3 settings are not configured as required\. battery\\_timer: no assigned policy'

            # A setting no policy configures fails the test and still has a row.
            & $setPolicy @{ desktop_timer = 10; battery_timer = 5 }
            & $test '^([1-9]|10)$' | Should -BeFalse
            $script:Detail.Result | Should -Match '\| portable\\_timer \| \(none in scope\) \| \(not set\) \| \| No \|'

            # One value per setting, in the same order (a choice setting's option id differs per setting).
            & $setPolicy @{ desktop_timer = 'desktop_timer_0'; battery_timer = 'battery_timer_0'; portable_timer = 'portable_timer_0' }
            & $test @('desktop_timer_0', 'battery_timer_0', 'portable_timer_0') 'eq' | Should -BeTrue
            & $test @('desktop_timer_0', 'battery_timer_1', 'portable_timer_0') 'eq' | Should -BeFalse
            { & $test @('desktop_timer_0', 'battery_timer_0') 'eq' } | Should -Throw '*one value for all of them, or one per setting*'
            { Test-JlIntuneSetting -Source settingsCatalog -Platform macOS -SettingDefinitionId $timers -Operator eq -Expected x -ChildSettingDefinitionId c -ChildExpected c_1 } | Should -Throw '*one SettingDefinitionId*'
        }

        It 'checks a property path for the other sources' {
            $script:Graph['deviceManagement/deviceCompliancePolicies'] = @([pscustomobject]@{ id = 'c1'; displayName = 'W11 Compliance'; '@odata.type' = '#microsoft.graph.windows10CompliancePolicy'; bitLockerEnabled = $true })
            $script:Graph["deviceManagement/deviceCompliancePolicies('c1')/assignments"] = @([pscustomobject]@{ target = [pscustomobject]@{ '@odata.type' = '#microsoft.graph.allDevicesAssignmentTarget' } })
            Test-JlIntuneSetting -Source compliance -ODataType '#microsoft.graph.windows10CompliancePolicy' -Property bitLockerEnabled -Operator eq -Expected $true | Should -BeTrue
        }

        It 'leaves out a compliance policy that leaves the property at Not configured (false)' {
            $script:Graph['deviceManagement/deviceCompliancePolicies'] = @(
                [pscustomobject]@{ id = 'c1'; displayName = 'W11 Compliance'; '@odata.type' = '#microsoft.graph.windows10CompliancePolicy'; bitLockerEnabled = $true }
                [pscustomobject]@{ id = 'c2'; displayName = 'W11 Defender'; '@odata.type' = '#microsoft.graph.windows10CompliancePolicy'; bitLockerEnabled = $false }
            )
            foreach ($id in 'c1', 'c2') { $script:Graph["deviceManagement/deviceCompliancePolicies('$id')/assignments"] = @([pscustomobject]@{ target = [pscustomobject]@{ '@odata.type' = '#microsoft.graph.allDevicesAssignmentTarget' } }) }
            Test-JlIntuneSetting -Source compliance -ODataType '#microsoft.graph.windows10CompliancePolicy' -Property bitLockerEnabled -Operator eq -Expected 'TRUE' | Should -BeTrue
            $script:Detail.Result | Should -Not -Match 'W11 Defender'
            # Only Not configured: no policy requires it.
            $script:Graph['deviceManagement/deviceCompliancePolicies'] = @($script:Graph['deviceManagement/deviceCompliancePolicies'][1])
            Test-JlIntuneSetting -Source compliance -ODataType '#microsoft.graph.windows10CompliancePolicy' -Property bitLockerEnabled -Operator eq -Expected 'TRUE' | Should -BeFalse
        }
    }
}
