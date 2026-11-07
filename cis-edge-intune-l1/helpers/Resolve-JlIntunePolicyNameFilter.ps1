# Copied from shared/helpers/Resolve-JlIntunePolicyNameFilter.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Resolve-JlIntunePolicyNameFilter {
    <#
    .SYNOPSIS
        The policy name filter a test uses: its own parameter, else the JLIntune.PolicyNameFilter setting, else none.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([string] $PolicyNameFilter)

    if ($PolicyNameFilter) { return $PolicyNameFilter }
    [string](Get-MtSetting -Name 'JLIntune.PolicyNameFilter' -Default '')
}
