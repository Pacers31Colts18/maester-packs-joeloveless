function Test-JLSirisettingsEnabled {
    [MaesterTest(
        Id           = 'MP.JL.CISMACINT.L1.025',
        Title        = 'Enabled is set to False',
        Product      = 'Intune',
        Feature      = 'CIS Apple MacOS 26 Tahoe Intune Benchark (L1)',
        Area         = 'Siri Settings',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-macos26-l1:2.14.3.1',
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
        [string] $Platform = 'macOS',

        # The settings catalog setting definition id to check.
        [string] $SettingDefinitionId = 'sirisettings_enabled',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'sirisettings_enabled_false',

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
