function Test-JLUserOutlk16v6PolicyLMicrosoftofficeoutlookLToolsaccountsLExchangesettingsLAuthenticationwithexchangeserverV2 {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.150',
        Title        = 'Authentication with Exchange server is set to Enabled: Kerberos Password Authentication',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Security Form Settings',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:2.5.14.3.9',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_security~l_securityformsettings_l_outlooksecuritymode',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_security~l_securityformsettings_l_outlooksecuritymode_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('user_vendor_msft_policy_config_outlk16v6~policy~l_microsoftofficeoutlook~l_toolsaccounts~l_exchangesettings_l_authenticationwithexchangeserver_v2', 'user_vendor_msft_policy_config_outlk16v6~policy~l_microsoftofficeoutlook~l_toolsaccounts~l_exchangesettings_l_authenticationwithexchangeserver_v2_l_selecttheauthenticationwithexchangeserver'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('user_vendor_msft_policy_config_outlk16v6~policy~l_microsoftofficeoutlook~l_toolsaccounts~l_exchangesettings_l_authenticationwithexchangeserver_v2_1', 'user_vendor_msft_policy_config_outlk16v6~policy~l_microsoftofficeoutlook~l_toolsaccounts~l_exchangesettings_l_authenticationwithexchangeserver_v2_l_selecttheauthenticationwithexchangeserver_16'),

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
