# Copied from shared/helpers/Get-JlIntuneSettingRow.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Get-JlIntuneSettingRow {
    <#
    .SYNOPSIS
        One row per policy in scope that configures the setting: Name, Value, Assigned, Targets, Meets. With child
        settings, Meets needs the setting and every child (its ChildOperator, eq by default, against its ChildExpected)
        in that policy, and Value lists the children's values after the setting's. For in, notIn and contains a child's
        expected values are separated by '|'.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string] $Source,
        [string] $SettingDefinitionId,
        [string] $Property,
        [Parameter(Mandatory)] [string] $Operator,
        [AllowNull()] [object] $Expected,
        [string] $Platform,
        [string] $ODataType,
        [string] $NameFilter,
        [string[]] $ChildSettingDefinitionId = @(),
        [string[]] $ChildExpected = @(),
        [string[]] $ChildOperator = @()
    )

    foreach ($policy in (Get-JlIntunePolicy -Source $Source -NameFilter $NameFilter -Platform $Platform -ODataType $ODataType -ComplianceActions:($Property -like 'scheduledActionsForRule*'))) {
        $settingList = if ($Source -eq 'settingsCatalog') { @(Get-JlIntunePolicySettingList -Policy $policy) } else { @() }
        $configured = Get-JlIntuneConfiguredValue -Policy $policy -Source $Source -SettingDefinitionId $SettingDefinitionId -Property $Property -SettingList $settingList
        if (-not $configured.Found) { continue }
        # A compliance or configuration profile property set to false is Not configured: Intune doesn't apply it, so the
        # policy neither meets nor conflicts with the requirement and is left out, like a settings catalog policy without
        # the setting.
        if ($Source -in 'compliance', 'deviceConfiguration' -and $configured.Values.Count -eq 1 -and "$($configured.Values[0])" -eq 'false') { continue }
        $meets = Test-JlIntuneValue -Actual $configured.Values -Operator $Operator -Expected $Expected
        $value = Format-JlIntuneValue -Values $configured.Values
        for ($i = 0; $i -lt @($ChildSettingDefinitionId).Count; $i++) {
            $child = Get-JlIntuneConfiguredValue -Policy $policy -Source $Source -SettingDefinitionId $ChildSettingDefinitionId[$i] -SettingList $settingList
            if (-not $child.Found) { $meets = $false; $value += "; $($ChildSettingDefinitionId[$i]): (not set)"; continue }
            $childOp = if (@($ChildOperator).Count) { $ChildOperator[$i] } else { 'eq' }
            $wanted = if ($childOp -in 'in', 'notIn', 'contains') { @($ChildExpected[$i] -split '\|') } else { $ChildExpected[$i] }
            if (-not (Test-JlIntuneValue -Actual $child.Values -Operator $childOp -Expected $wanted)) { $meets = $false }
            $value += "; $(Format-JlIntuneValue -Values $child.Values)"
        }
        $assignment = Get-JlIntuneAssignment -Policy $policy -Source $Source
        [pscustomobject]@{
            Name     = Get-JlIntunePolicyName -Policy $policy
            Value    = $value
            Assigned = $assignment.IsAssigned
            Targets  = $assignment.Targets
            Meets    = $meets
        }
    }
}
