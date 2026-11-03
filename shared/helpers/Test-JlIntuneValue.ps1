function Test-JlIntuneValue {
    <#
    .SYNOPSIS
        Compares the configured value(s) with the expected value using one operator. Comparisons are on strings,
        case-insensitive, except gt/ge/lt/le, which are numeric.
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [AllowNull()] [AllowEmptyCollection()] [object[]] $Actual,
        [Parameter(Mandatory)] [ValidateSet('eq', 'ne', 'gt', 'ge', 'lt', 'le', 'in', 'notIn', 'contains', 'match', 'exists')] [string] $Operator,
        [AllowNull()] [object] $Expected
    )

    $Actual = @($Actual | Where-Object { $null -ne $_ })
    $expectedText = @(@($Expected) | ForEach-Object { "$_" })
    $culture = [System.Globalization.CultureInfo]::InvariantCulture
    switch ($Operator) {
        'exists' { return $Actual.Count -gt 0 }
        'eq' { return $Actual.Count -eq 1 -and "$($Actual[0])" -eq "$Expected" }
        'ne' { return $Actual.Count -gt 0 -and @($Actual | Where-Object { "$_" -eq "$Expected" }).Count -eq 0 }
        'match' { return $Actual.Count -gt 0 -and @($Actual | Where-Object { "$_" -notmatch "$Expected" }).Count -eq 0 }
        'in' { return $Actual.Count -gt 0 -and @($Actual | Where-Object { "$_" -notin $expectedText }).Count -eq 0 }
        'notIn' { return $Actual.Count -gt 0 -and @($Actual | Where-Object { "$_" -in $expectedText }).Count -eq 0 }
        'contains' { return $Actual.Count -gt 0 -and @($expectedText | Where-Object { $_ -notin @($Actual | ForEach-Object { "$_" }) }).Count -eq 0 }
    }
    # gt / ge / lt / le
    if ($Actual.Count -ne 1) { return $false }
    $number = 0.0
    $target = 0.0
    if (-not [double]::TryParse("$($Actual[0])", [System.Globalization.NumberStyles]::Float, $culture, [ref]$number)) { return $false }
    if (-not [double]::TryParse("$Expected", [System.Globalization.NumberStyles]::Float, $culture, [ref]$target)) { throw "Operator '$Operator' needs a numeric expected value, not '$Expected'." }
    switch ($Operator) {
        'gt' { $number -gt $target }
        'ge' { $number -ge $target }
        'lt' { $number -lt $target }
        'le' { $number -le $target }
    }
}
