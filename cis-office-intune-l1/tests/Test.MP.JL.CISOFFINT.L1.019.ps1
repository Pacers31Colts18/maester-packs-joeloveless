function Test-JLUserAccess16v2PolicyLMicrosoftofficeaccessLApplicationsettingsLSecurityLTrustcenterLBlockmacroexecutionfrominternet {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.019',
        Title        = 'Access: Block macros from running in Office files from the internet is set to Enabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Trust Center',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-office-l1:2.1.1.3.2.2',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_access16v2~policy~l_microsoftofficeaccess~l_applicationsettings~l_security~l_trustcenter_l_blockmacroexecutionfrominternet',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_access16v2~policy~l_microsoftofficeaccess~l_applicationsettings~l_security~l_trustcenter_l_blockmacroexecutionfrominternet_1',

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
