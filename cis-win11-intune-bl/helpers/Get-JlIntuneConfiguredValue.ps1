# Copied from shared/helpers/Get-JlIntuneConfiguredValue.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Get-JlIntuneConfiguredValue {
    <#
    .SYNOPSIS
        Found / Values for a setting id (settings catalog) or a property path, dots for nested (other sources).
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
    $current = $Policy
    foreach ($segment in ($Property -split '\.')) {
        if ($null -eq $current -or $null -eq $current.PSObject.Properties[$segment]) { return @{ Found = $false; Values = @() } }
        $current = $current.$segment
    }
    $values = @($current | Where-Object { $null -ne $_ })
    @{ Found = $values.Count -gt 0; Values = $values }
}
