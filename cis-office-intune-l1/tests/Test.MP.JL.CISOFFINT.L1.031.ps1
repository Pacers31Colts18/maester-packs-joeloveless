function Test-JLUserExcel16v2PolicyLMicrosoftofficeexcelLExceloptionsLSaveLSaveexcelfilesasLSaveexcelfilesas1 {
    [MaesterTest(
        Id           = 'MP.JL.CISOFFINT.L1.031',
        Title        = 'Default file format is set to Enabled: Excel Workbook (*.xlsx)',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Office Benchmark (L1)',
        Area         = 'Save',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-office-l1:2.2.4.6.1',
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
        [string] $SettingDefinitionId = 'user_vendor_msft_policy_config_excel16v2~policy~l_microsoftofficeexcel~l_exceloptions~l_save_l_saveexcelfilesas',

        # The value the recommendation requires (the option id for a choice setting).
        [string[]] $Expected = 'user_vendor_msft_policy_config_excel16v2~policy~l_microsoftofficeexcel~l_exceloptions~l_save_l_saveexcelfilesas_1',

        # Child settings that must be set in the same policy, each to the ChildExpected value in the same position.
        [string[]] $ChildSettingDefinitionId = 'user_vendor_msft_policy_config_excel16v2~policy~l_microsoftofficeexcel~l_exceloptions~l_save_l_saveexcelfilesas_l_saveexcelfilesas1',

        # The value each child setting requires (the option id for a choice setting).
        [string[]] $ChildExpected = 'user_vendor_msft_policy_config_excel16v2~policy~l_microsoftofficeexcel~l_exceloptions~l_save_l_saveexcelfilesas_l_saveexcelfilesas1_51',

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
