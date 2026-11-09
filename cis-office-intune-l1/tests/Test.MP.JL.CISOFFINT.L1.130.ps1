function Test-JLUserOutlk16v2PolicyLMicrosoftofficeoutlookLSecurityLDisablerememberpasswordcheckboxforinternetemailsettingsdialo {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.130',
        Title        = 'Disable ''Remember password'' for Internet e-mail accounts is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:2.5.14.5',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_security_l_disablerememberpasswordcheckboxforinternetemailsettingsdialo',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_security_l_disablerememberpasswordcheckboxforinternetemailsettingsdialo_1',

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
