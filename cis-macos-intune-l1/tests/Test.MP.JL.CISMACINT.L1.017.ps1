function Test-JLPasscodeFailedattemptsresetinminutes {
    [MaesterTest(
        Id           = 'MP.JL.CISMACINT.L1.017',
        Title        = 'Failed Attempts Reset In Minutes is at least 15',
        Product      = 'Intune',
        Feature      = 'CIS Apple MacOS 26 Tahoe Intune Benchark (L1)',
        Area         = 'Passcode',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-macos26-l1:2.9.1.10',
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
        [string] $SettingDefinitionId = 'passcode_failedattemptsresetinminutes',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = '15',

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
        Operator            = 'ge'
        Expected            = $Expected
        PolicyNameFilter    = $PolicyNameFilter
        IncludeUnassigned   = $IncludeUnassigned
        AllowConflicts      = $AllowConflicts
    }

    Test-JlIntuneSetting @Params
}
