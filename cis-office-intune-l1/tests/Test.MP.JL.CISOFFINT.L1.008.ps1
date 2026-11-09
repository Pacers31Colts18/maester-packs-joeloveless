function Test-JLOffice16v2PolicyLMicrosoftofficemachineLSecuritysettingsmachineLIesecurityLLocalmachinezonelockdownsecurity {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.008',
        Title        = 'Local Machine Zone Lockdown Security is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'IE Security',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.2.5.1.6',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_excelexe29', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_exprwdexe38', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_grooveexe28', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_msaccessexe39', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_mse7exe41', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_mspubexe30', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_onenoteexe40', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_outlookexe36', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_powerpntexe31', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_pptviewexe32', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_spdesignexe37', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_visioexe33', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_winprojexe34', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_winwordexe35'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_excelexe29_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_exprwdexe38_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_grooveexe28_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_msaccessexe39_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_mse7exe41_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_mspubexe30_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_onenoteexe40_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_outlookexe36_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_powerpntexe31_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_pptviewexe32_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_spdesignexe37_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_visioexe33_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_winprojexe34_1', 'device_vendor_msft_policy_config_office16v2~policy~l_microsoftofficemachine~l_securitysettingsmachine~l_iesecurity_l_localmachinezonelockdownsecurity_l_winwordexe35_1'),

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
