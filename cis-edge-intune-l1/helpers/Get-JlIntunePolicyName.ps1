# Copied from shared/helpers/Get-JlIntunePolicyName.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Get-JlIntunePolicyName {
    <#
    .SYNOPSIS
        A policy's name: settings catalog policies use name, the other sources displayName.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([Parameter(Mandatory)] [object] $Policy)

    if ($Policy.name) { return [string]$Policy.name }
    [string]$Policy.displayName
}
