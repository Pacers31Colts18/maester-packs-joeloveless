function Get-JlIntuneConfiguredValue {
    <#
    .SYNOPSIS
        Found / Values for a setting id (settings catalog) or a property path (other sources): dots for nested, through
        lists too, and name[key=value] keeps the items of a list that match, as in
        scheduledActionsForRule.scheduledActionConfigurations[actionType=block].gracePeriodHours.
    #>
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory)] [object] $Policy,
        [Parameter(Mandatory)] [string] $Source,
        [string] $SettingDefinitionId,
        [string] $Property,
        [AllowEmptyCollection()] [object[]] $SettingList = @()
    )

    if ($Source -eq 'settingsCatalog') {
        $found = @($SettingList | Where-Object { $_.Id -eq $SettingDefinitionId })
        return @{ Found = $found.Count -gt 0; Values = @($found | ForEach-Object { $_.Values }) }
    }
    $current = @($Policy)
    foreach ($segment in ($Property -split '\.')) {
        $filter = [regex]::Match($segment, '^(\w+)\[(\w+)=([^\]]+)\]$')
        $name = if ($filter.Success) { $filter.Groups[1].Value } else { $segment }
        $current = @($current | Where-Object { $null -ne $_ -and $null -ne $_.PSObject.Properties[$name] } | ForEach-Object { $_.$name })
        if ($filter.Success) {
            $key = $filter.Groups[2].Value
            $wanted = $filter.Groups[3].Value
            $current = @($current | Where-Object { $null -ne $_ -and "$($_.$key)" -eq $wanted })
        }
    }
    $values = @($current | Where-Object { $null -ne $_ })
    @{ Found = $values.Count -gt 0; Values = $values }
}
