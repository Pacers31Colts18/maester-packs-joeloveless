function Test-JLOffice16v2PolicyLMicrosoftofficemachineLSecuritysettingsmachineLIesecurityLRestrictfiledownload {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.014',
        Title        = 'Restrict File Download is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'IE Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.2.5.1.12',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_excelexe1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_exprwdexe10', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_grooveexe0', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_msaccessexe11', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_mse7exe13', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_mspubexe2', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_onenoteexe12', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_outlookexe8', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_powerpntexe3', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_pptviewexe4', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_spdesignexe9', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_visioexe5', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_winprojexe6', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_winwordexe7'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_excelexe1_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_exprwdexe10_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_grooveexe0_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_msaccessexe11_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_mse7exe13_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_mspubexe2_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_onenoteexe12_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_outlookexe8_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_powerpntexe3_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_pptviewexe4_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_spdesignexe9_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_visioexe5_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_winprojexe6_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_restrictfiledownload_l_winwordexe7_1'),

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
