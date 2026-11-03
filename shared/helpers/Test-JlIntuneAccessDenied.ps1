function Test-JlIntuneAccessDenied {
    <#
    .SYNOPSIS
        Whether an error from Graph is a 401 or 403.
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param([Parameter(Mandatory)] [System.Management.Automation.ErrorRecord] $ErrorRecord)

    $response = $ErrorRecord.Exception.Response
    if ($response -and $response.StatusCode) { return [int]$response.StatusCode -in @(401, 403) }
    [bool]($ErrorRecord.Exception.Message -match '\b(401|403|Forbidden|Unauthorized)\b')
}
