function Get-JlIntunePolicy {
    <#
    .SYNOPSIS
        The policies of one source, filtered by name (wildcard), platform (settings catalog) and @odata.type.
        -ComplianceActions adds each compliance policy's actions for noncompliance, which Graph leaves out by default.
        tenantSetting is one object, the tenant's Compliance policy settings: no name or type to filter on.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string] $Source,
        [string] $NameFilter,
        [string] $Platform,
        [string] $ODataType,
        [switch] $ComplianceActions
    )

    if ($Source -eq 'tenantSetting') {
        return Invoke-MtGraphRequest -RelativeUri 'deviceManagement/settings' -ApiVersion beta | Add-Member -NotePropertyName displayName -NotePropertyValue 'Compliance policy settings' -Force -PassThru
    }
    $uri = Get-JlIntunePolicyUri -Source $Source
    $policies = if ($ComplianceActions) { @(Invoke-MtGraphRequest -RelativeUri $uri -ApiVersion beta -QueryParameters @{ '$expand' = 'scheduledActionsForRule($expand=scheduledActionConfigurations)' }) }
    else { @(Invoke-MtGraphRequest -RelativeUri $uri -ApiVersion beta) }
    if ($NameFilter) { $policies = @($policies | Where-Object { (Get-JlIntunePolicyName -Policy $_) -like $NameFilter }) }
    if ($Platform) { $policies = @($policies | Where-Object { $_.platforms -like "*$Platform*" }) }
    if ($ODataType) { $policies = @($policies | Where-Object { $_.'@odata.type' -eq $ODataType }) }
    $policies
}
