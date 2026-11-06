function Test-JLIosGeneralDeviceConfigurationAirPlayForcePairingPasswordForOutgoingRequests {
    [MaesterTest(
        Id           = 'MP.JL.CISIOSINT.L1.020',
        Title        = 'Require AirPlay outgoing requests pairing password is set to Yes',
        Product      = 'Intune',
        Feature      = 'CIS Apple iOS 26 and iPadOS 26 Intune Benchmark (L1)',
        Area         = 'Connected Devices',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-ios26-supl1:3.4.2',
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
        [string] $Source = 'deviceConfiguration',

        # compliance / deviceConfiguration only: the policy type, such as #microsoft.graph.windows10CompliancePolicy.
        [string] $ODataType = '#microsoft.graph.iosGeneralDeviceConfiguration',

        # The property to check, dots for nested.
        [string] $Property = 'airPlayForcePairingPasswordForOutgoingRequests',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'true',

        # Only policies whose name matches this wildcard count, such as 'W11-CIS-*'. Empty uses the JLIntune.PolicyNameFilter setting.
        [string] $PolicyNameFilter,

        # Count policies that are not assigned to anything.
        [bool] $IncludeUnassigned = $false,

        # Pass even when a counted policy sets a value that does not meet the requirement.
        [bool] $AllowConflicts = $false
    )

    $Params = @{
        Source              = $Source
        ODataType           = $ODataType
        Property            = $Property
        Operator            = 'eq'
        Expected            = $Expected
        PolicyNameFilter    = $PolicyNameFilter
        IncludeUnassigned   = $IncludeUnassigned
        AllowConflicts      = $AllowConflicts
    }

    Test-JlIntuneSetting @Params
}
