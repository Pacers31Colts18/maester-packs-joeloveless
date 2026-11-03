function Format-JlIntuneExpected {
    <#
    .SYNOPSIS
        An operator and expected value in words for the report, such as "eq 1" or "is configured".
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory)] [string] $Operator,
        [AllowNull()] [object] $Expected
    )

    if ($Operator -eq 'exists') { return 'is configured' }
    "$Operator $((@($Expected) | ForEach-Object { "$_" }) -join ', ')"
}
