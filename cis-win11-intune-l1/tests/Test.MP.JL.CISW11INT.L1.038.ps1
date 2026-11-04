function Test-JLSystemBootstartdriverinitialization {
    [MaesterTest(
        Id           = 'MP.JL.CISW11INT.L1.038',
        Title        = 'Boot-Start Driver Initialization Policy is set to Enabled: Good, unknown and bad but critical',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Windows 11 Benchmark (L1)',
        Area         = 'Early Launch Antimalware',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-win11-l1:4.10.13.1',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_system_bootstartdriverinitialization',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'device_vendor_msft_policy_config_system_bootstartdriverinitialization_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = 'device_vendor_msft_policy_config_system_bootstartdriverinitialization_selectdriverloadpolicy',

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = 'device_vendor_msft_policy_config_system_bootstartdriverinitialization_selectdriverloadpolicy_3',

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
