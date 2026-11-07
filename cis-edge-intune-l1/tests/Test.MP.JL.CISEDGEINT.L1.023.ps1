function Test-JLMicrosoftEdgePolicyMicrosoftEdgeSmartscreenPreventsmartscreenpromptoverrideforfiles {
    [MaesterTest(
        Id           = 'MP.JL.CISEDGEINT.L1.023',
        Title        = 'Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Edge Benchmark (L1)',
        Area         = 'SmartScreen settings',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-edge-l1:1.31.6',
        Service      = 'Graph',
        License      = 'INTUNE_A',
        Permission   = 'Graph:Scope:DeviceManagementConfiguration.Read.All',
        Author       = 'Pacers31Colts18'
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        # Where the setting lives: settingsCatalog, compliance, deviceConfiguration or tenantSetting.
        [ValidateSet('settingsCatalog', 'compliance', 'deviceConfiguration', 'tenantSetting')]
        [string] $Source = 'settingsCatalog',

        # settingsCatalog only: the platform the policy targets.
        [string] $Platform = 'windows10',

        # The settings catalog setting definition id to check.
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverrideforfiles',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge~smartscreen_preventsmartscreenpromptoverrideforfiles_1',

        # Only policies whose name matches this wildcard count, such as 'W11-CIS-*'. Empty uses the JLIntune.PolicyNameFilter setting.
        [string] $PolicyNameFilter,

        # Count policies that are not assigned to anything.
        [bool] $IncludeUnassigned = $false,

        # Pass even when a counted policy sets a value that does not meet the requirement.
        [bool] $AllowConflicts = $false
    )

    $Params = @{
        Source              = $Source
        Platform            = $Platform
        SettingDefinitionId = $SettingDefinitionId
        Operator            = 'eq'
        Expected            = $Expected
        PolicyNameFilter    = $PolicyNameFilter
        IncludeUnassigned   = $IncludeUnassigned
        AllowConflicts      = $AllowConflicts
    }

    Test-JlIntuneSetting @Params
}
