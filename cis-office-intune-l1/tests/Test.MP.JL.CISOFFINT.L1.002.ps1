function Test-JLSecguidev22h2PolicyCatSecguidePolSecguideLegacyJscript {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.002',
        Title        = 'Restrict legacy JScript execution for Office is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'MS Security Guide',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-office-l1:1.1.1.2',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = ('device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_msaccess', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_excel', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_onenote', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_outlook', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_powerpnt', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_winproj', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_mspub', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_visio', 'device_vendor_msft_policy_config_secguidev22h2~policy~cat_secguide_pol_secguide_legacy_jscript_pol_sg_winword'),

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = ('69632', '69632', '69632', '69632', '69632', '69632', '69632', '69632', '69632'),

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
