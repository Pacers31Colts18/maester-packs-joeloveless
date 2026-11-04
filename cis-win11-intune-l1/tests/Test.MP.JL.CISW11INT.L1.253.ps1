function Test-JLUserrightsReplaceprocessleveltoken {
    [MaesterTest(
        Id           = 'MP.JL.CISW11INT.L1.253',
        Title        = 'Replace Process Level Token is set to *S-1-5-19, *S-1-5-20',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Windows 11 Benchmark (L1)',
        Area         = 'User Rights',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-win11-l1:90.32',
        Service      = 'Graph',
        License      = 'INTUNE_A',
        Permission   = 'Graph:Scope:DeviceManagementConfiguration.Read.All',
        Author       = 'Pacers31Colts18'
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        # Where the setting lives: settingsCatalog, compliance or deviceConfiguration.
        [ValidateSet('settingsCatalog', 'compliance', 'deviceConfiguration')]
        [string] $Source = 'settingsCatalog',

        # settingsCatalog only: the platform the policy targets.
        [string] $Platform = 'windows10',

        # The settings catalog setting definition id to check.
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_userrights_replaceprocessleveltoken',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = ('*S-1-5-19', '*S-1-5-20'),

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
        Operator            = 'in'
        Expected            = $Expected
        PolicyNameFilter    = $PolicyNameFilter
        IncludeUnassigned   = $IncludeUnassigned
        AllowConflicts      = $AllowConflicts
    }

    Test-JlIntuneSetting @Params
}
