# Copied from shared/helpers/Format-JlIntuneValue.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function Format-JlIntuneValue {
    <#
    .SYNOPSIS
        Configured values as one table cell.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([AllowNull()] [AllowEmptyCollection()] [object[]] $Values)

    $text = (@($Values) | ForEach-Object { "$_" }) -join ', '
    if (-not $text) { return '(configured, no value)' }
    ConvertTo-JlIntuneCell -Text $text
}
