function Test-JLOffice16v2PolicyLMicrosoftofficemachineLSecuritysettingsmachineLIesecurityLConsistentmimehandling {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.005',
        Title        = 'Consistent Mime Handling is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'IE Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.2.5.1.3',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_excelexe43', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_exprwdexe52', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_grooveexe42', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_msaccessexe53', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_mse7exe55', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_mspubexe44', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_onenoteexe54', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_outlookexe50', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_powerpntexe45', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_pptviewexe46', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_spdesignexe51', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_visioexe47', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_winprojexe48', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_winwordexe49'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_excelexe43_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_exprwdexe52_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_grooveexe42_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_msaccessexe53_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_mse7exe55_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_mspubexe44_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_onenoteexe54_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_outlookexe50_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_powerpntexe45_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_pptviewexe46_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_spdesignexe51_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_visioexe47_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_winprojexe48_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_consistentmimehandling_l_winwordexe49_1'),

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
