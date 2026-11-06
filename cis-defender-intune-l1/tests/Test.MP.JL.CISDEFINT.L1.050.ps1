function Test-JLDefenderThreatseveritydefaultactionModerateseveritythreats {
    [MaesterTest(
        Id           = 'MP.JL.CISDEFINT.L1.050',
        Title        = 'Remediation action for Moderate severity threats is set to Quarantine or Remove',
        Product      = 'Intune',
        Feature      = 'CIS Intune for Microsoft Defender Antivirus Benchmark (L1)',
        Area         = 'Defender',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-defint-l1:2.48',
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
        [string] $SettingDefinitionId = 'device_vendor_msft_policy_config_defender_threatseveritydefaultaction_moderateseveritythreats',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = ('device_vendor_msft_policy_config_defender_threatseveritydefaultaction_moderateseveritythreats_quarantine', 'device_vendor_msft_policy_config_defender_threatseveritydefaultaction_moderateseveritythreats_remove'),

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
