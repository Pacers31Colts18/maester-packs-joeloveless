function Test-JLIosCompliancePolicyScheduledActionsForRuleScheduledActionConfigurationsActionTypeBlockGracePeriodHours {
    [MaesterTest(
        Id           = 'MP.JL.CISIOSINT.L1.052',
        Title        = 'Mark device noncompliant is set to Immediately',
        Product      = 'Intune',
        Feature      = 'CIS Apple iOS 26 and iPadOS 26 Intune Benchmark (L1)',
        Area         = 'Actions for noncompliance',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-ios26-supl1:4.3',
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
        [string] $Source = 'compliance',

        # compliance / deviceConfiguration only: the policy type, such as #microsoft.graph.windows10CompliancePolicy.
        [string] $ODataType = '#microsoft.graph.iosCompliancePolicy',

        # The property to check, dots for nested.
        [string] $Property = 'scheduledActionsForRule.scheduledActionConfigurations[actionType=block].gracePeriodHours',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = '0',

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
