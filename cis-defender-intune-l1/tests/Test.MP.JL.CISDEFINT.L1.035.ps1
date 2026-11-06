function Test-JLDefenderConfigurationReportingEnabledynamicsignaturedroppedeventreporting {
    [MaesterTest(
        Id           = 'MP.JL.CISDEFINT.L1.035',
        Title        = 'Enable Dynamic Signature Dropped Event Reporting is set to Dynamic Security intelligence update events will be reported',
        Product      = 'Intune',
        Feature      = 'CIS Intune for Microsoft Defender Antivirus Benchmark (L1)',
        Area         = 'Defender',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-defint-l1:2.32',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_defender_configuration_reporting_enabledynamicsignaturedroppedeventreporting',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_defender_configuration_reporting_enabledynamicsignaturedroppedeventreporting_1',

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
