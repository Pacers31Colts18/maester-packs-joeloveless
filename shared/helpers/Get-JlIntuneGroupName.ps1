function Get-JlIntuneGroupName {
    <#
    .SYNOPSIS
        A group's display name, cached for the session; the id itself when the group cannot be read.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param([Parameter(Mandatory)] [string] $GroupId)

    if ($null -eq $script:JlIntuneGroupNames) { $script:JlIntuneGroupNames = @{} }
    if (-not $script:JlIntuneGroupNames.ContainsKey($GroupId)) {
        try {
            $group = Invoke-MtGraphRequest -RelativeUri "groups/$GroupId" -Select displayName -ApiVersion v1.0
            $script:JlIntuneGroupNames[$GroupId] = [string]$group.displayName
        } catch {
            $script:JlIntuneGroupNames[$GroupId] = $GroupId
        }
    }
    $script:JlIntuneGroupNames[$GroupId]
}
