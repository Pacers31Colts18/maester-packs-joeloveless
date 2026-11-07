# Copied from shared/helpers/ConvertTo-JlIntuneCell.ps1 by tools/Sync-Helpers.ps1. Do not edit here.
function ConvertTo-JlIntuneCell {
    <#
    .SYNOPSIS
        Text made safe for a markdown table cell: Markdown characters (\ ` * _ |) escaped, so \\*\NETLOGON shows as
        written, and line breaks removed.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([AllowNull()] [AllowEmptyString()] [string] $Text)

    ($Text -replace '([\\`*_|])', '\$1') -replace '\r\n|\n|\r', ' '
}
