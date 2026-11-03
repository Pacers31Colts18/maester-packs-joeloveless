function Get-JlIntunePolicySettingList {
    <#
    .SYNOPSIS
        Every flattened setting of one settings catalog policy.
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)] [object] $Policy)

    $settings = @(Invoke-MtGraphRequest -RelativeUri "deviceManagement/configurationPolicies('$($Policy.id)')/settings" -ApiVersion beta)
    foreach ($setting in $settings) { ConvertTo-JlIntuneSettingList -Instance $setting.settingInstance }
}
