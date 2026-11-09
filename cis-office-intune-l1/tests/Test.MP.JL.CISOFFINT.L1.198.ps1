function Test-JLUserPub16v2PolicyLMicrosoftofficepublisherLSecurityLTrustcenterLVbawarningspolicyLEmpty0 {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.198',
        Title        = 'Publisher: VBA Macro Notification Settings is set to Enabled: Disable all except digitally signed macros',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Trust Center',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-office-l1:2.8.4.1.4',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_pub16v2~policy~l_microsoftofficepublisher~l_security~l_trustcenter_l_vbawarningspolicy',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_pub16v2~policy~l_microsoftofficepublisher~l_security~l_trustcenter_l_vbawarningspolicy_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = 'user_vendor_msft_policy_config_pub16v2~policy~l_microsoftofficepublisher~l_security~l_trustcenter_l_vbawarningspolicy_l_empty0',

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = 'user_vendor_msft_policy_config_pub16v2~policy~l_microsoftofficepublisher~l_security~l_trustcenter_l_vbawarningspolicy_l_empty0_3',

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
