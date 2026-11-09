function Test-JLUserOutlk16v2PolicyLMicrosoftofficeoutlookLOutlookoptionsLPreferencesLCalendaroptionsLMicrosoftofficeonlinesharingLRestrictlevelofcalendardetailsLEmpty4 {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.124',
        Title        = 'Restrict level of calendar details users can publish is set to Enabled: Disables Full details and Limited details',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Office.com Sharing Service',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:2.5.10.8.1.2.4',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_outlookoptions~l_preferences~l_calendaroptions~l_microsoftofficeonlinesharing_l_restrictlevelofcalendardetails',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_outlookoptions~l_preferences~l_calendaroptions~l_microsoftofficeonlinesharing_l_restrictlevelofcalendardetails_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_outlookoptions~l_preferences~l_calendaroptions~l_microsoftofficeonlinesharing_l_restrictlevelofcalendardetails_l_empty4',

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = 'user_vendor_msft_policy_config_outlk16v2~policy~l_microsoftofficeoutlook~l_outlookoptions~l_preferences~l_calendaroptions~l_microsoftofficeonlinesharing_l_restrictlevelofcalendardetails_l_empty4_16384',

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
