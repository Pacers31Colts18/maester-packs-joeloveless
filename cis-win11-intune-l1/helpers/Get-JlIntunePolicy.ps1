# Copied from shared/helpers/Get-JlIntunePolicy.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Get-JlIntunePolicy {
    <#
    .SYNOPSIS
        The policies of one source, filtered by name (wildcard), platform (settings catalog) and @odata.type.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string] $Source,
        [string] $NameFilter,
        [string] $Platform,
        [string] $ODataType
    )

    $policies = @(Invoke-MtGraphRequest -RelativeUri (Get-JlIntunePolicyUri -Source $Source) -ApiVersion beta)
    if ($NameFilter) { $policies = @($policies | Where-Object { (Get-JlIntunePolicyName -Policy $_) -like $NameFilter }) }
    if ($Platform) { $policies = @($policies | Where-Object { $_.platforms -like "*$Platform*" }) }
    if ($ODataType) { $policies = @($policies | Where-Object { $_.'@odata.type' -eq $ODataType }) }
    $policies
}
