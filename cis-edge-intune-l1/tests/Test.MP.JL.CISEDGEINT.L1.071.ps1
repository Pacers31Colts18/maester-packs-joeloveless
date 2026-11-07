function Test-JLMicrosoftEdgePolicyMicrosoftEdgeNetworkpredictionoptionsNetworkpredictionoptions {
    [MaesterTest(
        Id           = 'MP.JL.CISEDGEINT.L1.071',
        Title        = 'Enable network prediction is set to Enabled: Don''t predict network actions on any network connection',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Edge Benchmark (L1)',
        Area         = 'Microsoft Edge',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-edge-l1:1.98',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_networkpredictionoptions',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_networkpredictionoptions_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_networkpredictionoptions_networkpredictionoptions',

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = 'device_vendor_msft_policy_config_microsoft_edge~policy~microsoft_edge_networkpredictionoptions_networkpredictionoptions_2',

        # Only policies whose name matches this wildcard count, such as 'W11-CIS-*'. Empty uses the JLIntune.PolicyNameFilter setting.
        [string] $PolicyNameFilter,

        # Count policies that are not assigned to anything.
        [bool] $IncludeUnassigned = $false,

        # Pass even when a counted policy sets a value that does not meet the requirement.
        [bool] $AllowConflicts = $false
    )

    $Params = @{
        Source                   = $Source
        Platform                 = $Platform
        SettingDefinitionId      = $SettingDefinitionId
        Operator                 = 'eq'
        Expected                 = $Expected
        ChildSettingDefinitionId = $ChildSettingDefinitionId
        ChildExpected            = $ChildExpected
        PolicyNameFilter         = $PolicyNameFilter
        IncludeUnassigned        = $IncludeUnassigned
        AllowConflicts           = $AllowConflicts
    }

    Test-JlIntuneSetting @Params
}
