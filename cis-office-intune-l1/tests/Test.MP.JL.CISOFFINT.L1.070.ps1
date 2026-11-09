function Test-JLUserOffice16v2PolicyLMicrosoftofficesystemLGloabloptionsLCustomizeLNoextensibilitycustomizationfromdocumentpolicy {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.070',
        Title        = 'Disable UI extending from documents and templates is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Customize',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:2.3.6.2',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyaccess', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyexcel', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyinfopath', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyoutlook', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicypowerpoint', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyproject', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicypublisher', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyvisio', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyword'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyaccess_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyexcel_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyinfopath_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyoutlook_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicypowerpoint_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyproject_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicypublisher_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyvisio_1', 'user_vendor_msft_policy_config_office16v2~policy~l_microsoftofficesystem~l_gloabloptions~l_customize_l_noextensibilitycustomizationfromdocumentpolicy_l_noextensibilitycustomizationfromdocumentpolicyword_1'),

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
