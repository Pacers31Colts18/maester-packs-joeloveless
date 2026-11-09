# Copied from shared/helpers/ConvertTo-JlIntuneSettingList.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function ConvertTo-JlIntuneSettingList {
    <#
    .SYNOPSIS
        Flattens a settings catalog settingInstance and all of its children into Id / Values / IsGroup rows.
    #>
    [CmdletBinding()]
    param([AllowNull()] [object] $Instance)

    if ($null -eq $Instance) { return }
    $values = @()
    $children = @()
    switch ($Instance.'@odata.type') {
        '#microsoft.graph.deviceManagementConfigurationChoiceSettingInstance' {
            $values = @($Instance.choiceSettingValue.value)
            $children = @($Instance.choiceSettingValue.children)
        }
        '#microsoft.graph.deviceManagementConfigurationChoiceSettingCollectionInstance' {
            $values = @($Instance.choiceSettingCollectionValue.value)
            $children = @($Instance.choiceSettingCollectionValue.children)
        }
        '#microsoft.graph.deviceManagementConfigurationSimpleSettingInstance' {
            $values = @($Instance.simpleSettingValue.value)
        }
        '#microsoft.graph.deviceManagementConfigurationSimpleSettingCollectionInstance' {
            $values = @($Instance.simpleSettingCollectionValue.value)
        }
        '#microsoft.graph.deviceManagementConfigurationGroupSettingInstance' {
            $children = @($Instance.groupSettingValue.children)
        }
        '#microsoft.graph.deviceManagementConfigurationGroupSettingCollectionInstance' {
            $children = @($Instance.groupSettingCollectionValue.children)
        }
    }
    [pscustomobject]@{
        Id      = [string]$Instance.settingDefinitionId
        Values  = @($values | Where-Object { $null -ne $_ })
        IsGroup = [string]$Instance.'@odata.type' -like '*GroupSetting*'
    }
    foreach ($child in @($children | Where-Object { $null -ne $_ })) { ConvertTo-JlIntuneSettingList -Instance $child }
}
