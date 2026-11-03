function Test-JlIntuneSetting {
    <#
    .SYNOPSIS
        The body of a setting test. Passes when at least one counted policy sets the setting as expected and, unless
        -AllowConflicts, no counted policy sets a value that does not meet it. By default only assigned policies count.
        Writes the result table with Add-MtTestResultDetail and returns $true or $false; skips on access denied.
    .PARAMETER Source
        settingsCatalog (settings catalog and Endpoint Security), compliance or deviceConfiguration.
    .PARAMETER SettingDefinitionId
        settingsCatalog only: the setting definition id.
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
        [string] $SettingDefinitionId,
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

    if ($Source -eq 'settingsCatalog' -and -not $SettingDefinitionId) { throw 'Source settingsCatalog needs -SettingDefinitionId.' }
    if ($Source -ne 'settingsCatalog' -and -not $Property) { throw "Source $Source needs -Property." }
    $ChildSettingDefinitionId = @($ChildSettingDefinitionId | Where-Object { $_ })
    # An exists child has an empty expected value, so only nulls are left out.
    $ChildExpected = @($ChildExpected | Where-Object { $null -ne $_ })
    if ($ChildSettingDefinitionId.Count -ne $ChildExpected.Count) { throw "ChildSettingDefinitionId has $($ChildSettingDefinitionId.Count) value(s) and ChildExpected $($ChildExpected.Count); they go in pairs." }
    $ChildOperator = @($ChildOperator | Where-Object { $_ })
    if ($ChildOperator.Count -and $ChildOperator.Count -ne $ChildSettingDefinitionId.Count) { throw "ChildSettingDefinitionId has $($ChildSettingDefinitionId.Count) value(s) and ChildOperator $($ChildOperator.Count); pass one operator per child setting, or none for eq." }
    if (-not $ChildOperator.Count) { $ChildOperator = @($ChildSettingDefinitionId | ForEach-Object { 'eq' }) }
    if ($ChildSettingDefinitionId.Count -and $Source -ne 'settingsCatalog') { throw 'Child settings are for the settingsCatalog source.' }
    $target = if ($Source -eq 'settingsCatalog') { $SettingDefinitionId } else { $Property }
    $nameFilter = Resolve-JlIntunePolicyNameFilter -PolicyNameFilter $PolicyNameFilter

    try {
        $rows = @(Get-JlIntuneSettingRow -Source $Source -SettingDefinitionId $SettingDefinitionId -Property $Property -Operator $Operator -Expected $Expected -Platform $Platform -ODataType $ODataType -NameFilter $nameFilter -ChildSettingDefinitionId $ChildSettingDefinitionId -ChildExpected $ChildExpected -ChildOperator $ChildOperator)
    } catch {
        if (Test-JlIntuneAccessDenied -ErrorRecord $_) {
            Add-MtTestResultDetail -SkippedBecause NotAuthorized
            return $null
        }
        throw
    }

    $counted = @($rows | Where-Object { $IncludeUnassigned -or $_.Assigned })
    $passing = @($counted | Where-Object { $_.Meets })
    $conflicts = @($counted | Where-Object { -not $_.Meets })
    $result = $passing.Count -gt 0 -and ($AllowConflicts -or $conflicts.Count -eq 0)
    $scope = if ($IncludeUnassigned) { '' } else { 'assigned ' }

    $md = [System.Text.StringBuilder]::new()
    $null = $md.Append("**Checks:** ``$target`` $(Format-JlIntuneExpected -Operator $Operator -Expected $Expected)")
    for ($i = 0; $i -lt $ChildSettingDefinitionId.Count; $i++) {
        $wanted = if ($ChildOperator[$i] -in 'in', 'notIn', 'contains') { @($ChildExpected[$i] -split '\|') } else { $ChildExpected[$i] }
        $null = $md.Append(", with ``$($ChildSettingDefinitionId[$i])`` $(Format-JlIntuneExpected -Operator $ChildOperator[$i] -Expected $wanted)")
    }
    if ($ChildSettingDefinitionId.Count) { $null = $md.Append(' in the same policy') }
    if ($nameFilter) { $null = $md.Append(" in policies named ``$nameFilter``") }
    $null = $md.AppendLine().AppendLine()
    $null = $md.AppendLine("**Counts:** $(if ($IncludeUnassigned) { 'every policy' } else { 'assigned policies only' }); a conflicting value $(if ($AllowConflicts) { 'is allowed' } else { 'fails the test' }).").AppendLine()
    if ($rows.Count -eq 0) {
        $null = $md.AppendLine("No $Source policy in scope configures this setting.")
    } else {
        $null = $md.AppendLine('| Policy | Configured value | Assigned to | Meets the requirement |').AppendLine('| --- | --- | --- | --- |')
        foreach ($row in $rows) {
            $meets = if ($row.Meets) { 'Yes' } else { 'No' }
            if (-not $IncludeUnassigned -and -not $row.Assigned) { $meets += ' (not counted: unassigned)' }
            $null = $md.AppendLine("| $(ConvertTo-JlIntuneCell -Text $row.Name) | $($row.Value) | $(ConvertTo-JlIntuneCell -Text $row.Targets) | $meets |")
        }
    }
    $null = $md.AppendLine()
    if ($result) { $null = $md.Append('**Result:** Well done. The setting is configured as required.') }
    elseif ($passing.Count -eq 0) { $null = $md.Append("**Result:** No ${scope}policy configures the setting as required.") }
    else { $null = $md.Append("**Result:** $($conflicts.Count) ${scope}policy/policies set a conflicting value.") }

    Add-MtTestResultDetail -Result $md.ToString()
    $result
}
