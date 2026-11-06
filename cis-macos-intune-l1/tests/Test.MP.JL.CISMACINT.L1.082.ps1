function Test-JLComAppleMcxWakeOnModemRing {
    [MaesterTest(
        Id           = 'MP.JL.CISMACINT.L1.082',
        Title        = 'Wake On Modem Ring is set to False',
        Product      = 'Intune',
        Feature      = 'CIS Apple MacOS 26 Tahoe Intune Benchark (L1)',
        Area         = 'Energy Saver',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-macos26-l1:2.11.1.4',
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

        # The settings catalog setting definition ids to check; each must pass on its own.
        [string[]] $SettingDefinitionId = ('com.apple.mcx_com.apple.energysaver.desktop.acpower_wake on modem ring', 'com.apple.mcx_com.apple.energysaver.portable.batterypower_wake on modem ring', 'com.apple.mcx_com.apple.energysaver.portable.acpower_wake on modem ring'),

        # The value each setting requires, in the same order, or one value for all of them (the option id for a choice setting).
        [string[]] $Expected = ('com.apple.mcx_com.apple.energysaver.desktop.acpower_wake on modem ring_0', 'com.apple.mcx_com.apple.energysaver.portable.batterypower_wake on modem ring_0', 'com.apple.mcx_com.apple.energysaver.portable.acpower_wake on modem ring_0'),

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
