function Test-JLOffice16v2PolicyLMicrosoftofficemachineLSecuritysettingsmachineLIesecurityLSavedfromurl {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.015',
        Title        = 'Saved from URL is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'IE Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.2.5.1.13',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_excelexe155', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_exprwdexe164', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_grooveexe154', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_msaccessexe165', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_mse7exe167', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_mspubexe156', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_onenoteexe166', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_outlookexe162', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_powerpntexe157', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_pptviewexe158', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_spdesignexe163', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_visioexe159', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_winprojexe160', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_winwordexe161'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_excelexe155_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_exprwdexe164_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_grooveexe154_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_msaccessexe165_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_mse7exe167_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_mspubexe156_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_onenoteexe166_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_outlookexe162_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_powerpntexe157_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_pptviewexe158_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_spdesignexe163_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_visioexe159_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_winprojexe160_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_savedfromurl_l_winwordexe161_1'),

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
