# Copied from shared/helpers/Get-JlIntunePolicyUri.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Get-JlIntunePolicyUri {
    <#
    .SYNOPSIS
        The Graph path of one Intune policy source.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([Parameter(Mandatory)] [ValidateSet('settingsCatalog', 'compliance', 'deviceConfiguration')] [string] $Source)

    switch ($Source) {
        'settingsCatalog' { 'deviceManagement/configurationPolicies' }
        'compliance' { 'deviceManagement/deviceCompliancePolicies' }
        'deviceConfiguration' { 'deviceManagement/deviceConfigurations' }
    }
}
