function Test-JLWindows10CompliancePolicySecureBootEnabled {
    [MaesterTest(
        Id           = 'MP.JL.CISW11INT.L1.302',
        Title        = 'Require Secure Boot to be enabled on the device is set to Require',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Windows 11 Benchmark (L1)',
        Area         = 'Device Compliance - Device Health',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-win11-l1:106.1.2',
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
        [string] $Source = 'compliance',

        # compliance / deviceConfiguration only: the policy type, such as #microsoft.graph.windows10CompliancePolicy.
        [string] $ODataType = '#microsoft.graph.windows10CompliancePolicy',

        # The policy property to check, dots for nested.
        [string] $Property = 'secureBootEnabled',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'TRUE',

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
