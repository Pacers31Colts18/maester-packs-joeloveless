function Test-JLOffice16v2PolicyLMicrosoftofficemachineLSecuritysettingsmachineLIesecurityLProtectionfromzoneelevation {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.012',
        Title        = 'Protection From Zone Elevation is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'IE Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.2.5.1.10',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_excelexe99', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_exprwdexe108', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_grooveexe98', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_msaccessexe109', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_mse7exe111', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_mspubexe100', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_onenoteexe110', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_outlookexe106', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_powerpntexe101', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_pptviewexe102', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_spdesignexe107', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_visioexe103', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_winprojexe104', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_winwordexe105'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_excelexe99_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_exprwdexe108_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_grooveexe98_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_msaccessexe109_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_mse7exe111_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_mspubexe100_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_onenoteexe110_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_outlookexe106_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_powerpntexe101_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_pptviewexe102_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_spdesignexe107_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_visioexe103_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_winprojexe104_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_protectionfromzoneelevation_l_winwordexe105_1'),

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
