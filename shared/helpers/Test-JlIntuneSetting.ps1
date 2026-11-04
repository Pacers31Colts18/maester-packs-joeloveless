function Test-JlIntuneSetting {
    <#
    .SYNOPSIS
        The body of a setting test. Passes when at least one counted policy sets the setting as expected and, unless
        -AllowConflicts, no counted policy sets a value that does not meet it. By default only assigned policies count.
        Writes the result table with Add-MtTestResultDetail and returns $true or $false; skips on access denied.
    .PARAMETER Source
        settingsCatalog (settings catalog and Endpoint Security), compliance or deviceConfiguration.
    .PARAMETER SettingDefinitionId
        settingsCatalog only: the setting definition id. Several when the recommendation needs each of them (such as
        one timer under Desktop Power, Laptop Battery Power and Laptop Power): the test passes only when every one
        passes on its own, and takes no child settings.
    .PARAMETER Expected
        The required value. With several SettingDefinitionId, one value for all of them or one per setting in the
        same order (for in, notIn and contains, a setting's values separated by '|').
    .PARAMETER Property
        compliance / deviceConfiguration only: the property path, dots for nested.
    .PARAMETER Platform
        settingsCatalog only: the platforms filter, such as windows10.
    .PARAMETER ODataType
        compliance / deviceConfiguration only: the policy type, such as #microsoft.graph.windows10CompliancePolicy.
    .PARAMETER ChildSettingDefinitionId
        settingsCatalog only: child settings (such as the options under an Administrative Templates setting's Enabled)
        that must also be set, in the same policy, to the ChildExpected value in the same position.
    .PARAMETER ChildExpected
        The value each child setting requires (the option id for a choice setting). For in, notIn and contains, the
        values separated by '|'; for exists, empty.
    .PARAMETER ChildOperator
        How each child setting is compared with its ChildExpected, in the same position: eq when left out.
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [Parameter(Mandatory)] [ValidateSet('settingsCatalog', 'compliance', 'deviceConfiguration')] [string] $Source,
        [string[]] $SettingDefinitionId = @(),
        [string] $Property,
        [Parameter(Mandatory)] [ValidateSet('eq', 'ne', 'gt', 'ge', 'lt', 'le', 'in', 'notIn', 'contains', 'match', 'exists')] [string] $Operator,
        [AllowNull()] [object] $Expected,
        [string] $Platform,
        [string] $ODataType,
        [string[]] $ChildSettingDefinitionId = @(),
        [string[]] $ChildExpected = @(),
        [ValidateSet('eq', 'ne', 'gt', 'ge', 'lt', 'le', 'in', 'notIn', 'contains', 'match', 'exists')] [string[]] $ChildOperator = @(),
        [string] $PolicyNameFilter,
        [bool] $IncludeUnassigned = $false,
        [bool] $AllowConflicts = $false
    )

    $SettingDefinitionId = @($SettingDefinitionId | Where-Object { $_ })
    if ($Source -eq 'settingsCatalog' -and -not $SettingDefinitionId.Count) { throw 'Source settingsCatalog needs -SettingDefinitionId.' }
    $several = $SettingDefinitionId.Count -gt 1
    if ($Source -ne 'settingsCatalog' -and -not $Property) { throw "Source $Source needs -Property." }
    $ChildSettingDefinitionId = @($ChildSettingDefinitionId | Where-Object { $_ })
    # An exists child has an empty expected value, so only nulls are left out.
    $ChildExpected = @($ChildExpected | Where-Object { $null -ne $_ })
    if ($ChildSettingDefinitionId.Count -ne $ChildExpected.Count) { throw "ChildSettingDefinitionId has $($ChildSettingDefinitionId.Count) value(s) and ChildExpected $($ChildExpected.Count); they go in pairs." }
    $ChildOperator = @($ChildOperator | Where-Object { $_ })
    if ($ChildOperator.Count -and $ChildOperator.Count -ne $ChildSettingDefinitionId.Count) { throw "ChildSettingDefinitionId has $($ChildSettingDefinitionId.Count) value(s) and ChildOperator $($ChildOperator.Count); pass one operator per child setting, or none for eq." }
    if (-not $ChildOperator.Count) { $ChildOperator = @($ChildSettingDefinitionId | ForEach-Object { 'eq' }) }
    if ($ChildSettingDefinitionId.Count -and $Source -ne 'settingsCatalog') { throw 'Child settings are for the settingsCatalog source.' }
    if ($several -and $ChildSettingDefinitionId.Count) { throw 'Child settings go with one SettingDefinitionId.' }
    $nameFilter = Resolve-JlIntunePolicyNameFilter -PolicyNameFilter $PolicyNameFilter
    $scope = if ($IncludeUnassigned) { '' } else { 'assigned ' }

    # One check per setting. A single setting takes Expected as it is; several take one value for all of them or one
    # per setting (a setting's values for in, notIn and contains separated by '|').
    $checks = if (-not $several) {
        $target = if ($Source -eq 'settingsCatalog') { $SettingDefinitionId[0] } else { $Property }
        @([pscustomobject]@{ Target = $target; Expected = $Expected; Rows = @(); Passing = 0; Conflicts = 0; Pass = $false })
    } else {
        $values = @(@($Expected) | Where-Object { $null -ne $_ } | ForEach-Object { "$_" })
        if ($Operator -ne 'exists' -and $values.Count -ne 1 -and $values.Count -ne $SettingDefinitionId.Count) { throw "SettingDefinitionId has $($SettingDefinitionId.Count) settings and Expected $($values.Count) values; pass one value for all of them, or one per setting." }
        @(for ($i = 0; $i -lt $SettingDefinitionId.Count; $i++) {
                $value = if ($Operator -eq 'exists') { $null } elseif ($values.Count -eq 1) { $values[0] } else { $values[$i] }
                $wanted = if ($Operator -in 'in', 'notIn', 'contains') { @($value -split '\|') } else { $value }
                [pscustomobject]@{ Target = $SettingDefinitionId[$i]; Expected = $wanted; Rows = @(); Passing = 0; Conflicts = 0; Pass = $false }
            })
    }

    try {
        foreach ($check in $checks) {
            $id = if ($Source -eq 'settingsCatalog') { $check.Target } else { '' }
            $check.Rows = @(Get-JlIntuneSettingRow -Source $Source -SettingDefinitionId $id -Property $Property -Operator $Operator -Expected $check.Expected -Platform $Platform -ODataType $ODataType -NameFilter $nameFilter -ChildSettingDefinitionId $ChildSettingDefinitionId -ChildExpected $ChildExpected -ChildOperator $ChildOperator)
        }
    } catch {
        if (Test-JlIntuneAccessDenied -ErrorRecord $_) {
            Add-MtTestResultDetail -SkippedBecause NotAuthorized
            return $null
        }
        throw
    }

    foreach ($check in $checks) {
        $counted = @($check.Rows | Where-Object { $IncludeUnassigned -or $_.Assigned })
        $check.Passing = @($counted | Where-Object { $_.Meets }).Count
        $check.Conflicts = @($counted | Where-Object { -not $_.Meets }).Count
        $check.Pass = $check.Passing -gt 0 -and ($AllowConflicts -or $check.Conflicts -eq 0)
    }
    $result = @($checks | Where-Object { -not $_.Pass }).Count -eq 0

    $md = [System.Text.StringBuilder]::new()
    $null = $md.Append("**Checks:** $(@($checks | ForEach-Object { "``$($_.Target)`` $(Format-JlIntuneExpected -Operator $Operator -Expected $_.Expected)" }) -join ', ')")
    for ($i = 0; $i -lt $ChildSettingDefinitionId.Count; $i++) {
        $wanted = if ($ChildOperator[$i] -in 'in', 'notIn', 'contains') { @($ChildExpected[$i] -split '\|') } else { $ChildExpected[$i] }
        $null = $md.Append(", with ``$($ChildSettingDefinitionId[$i])`` $(Format-JlIntuneExpected -Operator $ChildOperator[$i] -Expected $wanted)")
    }
    if ($ChildSettingDefinitionId.Count) { $null = $md.Append(' in the same policy') }
    if ($several) { $null = $md.Append(', each setting on its own') }
    if ($nameFilter) { $null = $md.Append(" in policies named ``$nameFilter``") }
    $null = $md.AppendLine().AppendLine()
    $null = $md.AppendLine("**Counts:** $(if ($IncludeUnassigned) { 'every policy' } else { 'assigned policies only' }); a conflicting value $(if ($AllowConflicts) { 'is allowed' } else { 'fails the test' }).").AppendLine()
    # The Meets the requirement cell of each row.
    foreach ($row in @($checks | ForEach-Object { $_.Rows })) {
        $meets = if ($row.Meets) { 'Yes' } else { 'No' }
        if (-not $IncludeUnassigned -and -not $row.Assigned) { $meets += ' (not counted: unassigned)' }
        $row | Add-Member -NotePropertyName MeetsCell -NotePropertyValue $meets -Force
    }
    if (-not $several) {
        $check = $checks[0]
        if ($check.Rows.Count -eq 0) {
            $null = $md.AppendLine("No $Source policy in scope configures this setting.")
        } else {
            $null = $md.AppendLine('| Policy | Configured value | Assigned to | Meets the requirement |').AppendLine('| --- | --- | --- | --- |')
            foreach ($row in $check.Rows) { $null = $md.AppendLine("| $(ConvertTo-JlIntuneCell -Text $row.Name) | $($row.Value) | $(ConvertTo-JlIntuneCell -Text $row.Targets) | $($row.MeetsCell) |") }
        }
        $null = $md.AppendLine()
        if ($result) { $null = $md.Append('**Result:** Well done. The setting is configured as required.') }
        elseif ($check.Passing -eq 0) { $null = $md.Append("**Result:** No ${scope}policy configures the setting as required.") }
        else { $null = $md.Append("**Result:** $($check.Conflicts) ${scope}policy/policies set a conflicting value.") }
    } else {
        # Every setting has a row, so a setting no policy configures shows as not set.
        $null = $md.AppendLine('| Setting | Policy | Configured value | Assigned to | Meets the requirement |').AppendLine('| --- | --- | --- | --- | --- |')
        foreach ($check in $checks) {
            $setting = ConvertTo-JlIntuneCell -Text $check.Target
            if ($check.Rows.Count -eq 0) { $null = $md.AppendLine("| $setting | (none in scope) | (not set) | | No |") }
            foreach ($row in $check.Rows) { $null = $md.AppendLine("| $setting | $(ConvertTo-JlIntuneCell -Text $row.Name) | $($row.Value) | $(ConvertTo-JlIntuneCell -Text $row.Targets) | $($row.MeetsCell) |") }
        }
        $null = $md.AppendLine()
        if ($result) { $null = $md.Append('**Result:** Well done. Every setting is configured as required.') }
        else {
            $why = @($checks | Where-Object { -not $_.Pass } | ForEach-Object {
                    if ($_.Passing -eq 0) { "$(ConvertTo-JlIntuneCell -Text $_.Target): no ${scope}policy configures it as required" }
                    else { "$(ConvertTo-JlIntuneCell -Text $_.Target): $($_.Conflicts) ${scope}policy/policies set a conflicting value" }
                })
            $null = $md.Append("**Result:** $($why.Count) of $($checks.Count) settings are not configured as required. $($why -join '; ').")
        }
    }

    Add-MtTestResultDetail -Result $md.ToString()
    $result
}
