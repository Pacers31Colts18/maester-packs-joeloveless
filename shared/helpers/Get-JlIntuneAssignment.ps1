function Get-JlIntuneAssignment {
    <#
    .SYNOPSIS
        IsAssigned, Keys (AllDevices / AllUsers / group id of each include) and a readable Targets string.
    #>
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory)] [object] $Policy,
        [Parameter(Mandatory)] [string] $Source
    )

    # The tenant's Compliance policy settings have no assignments: they apply to every device.
    if ($Source -eq 'tenantSetting') { return @{ IsAssigned = $true; Keys = @('AllDevices'); Targets = 'All devices' } }
    $assignments = @(Invoke-MtGraphRequest -RelativeUri "$(Get-JlIntunePolicyUri -Source $Source)('$($Policy.id)')/assignments" -ApiVersion beta)
    $keys = [System.Collections.Generic.List[string]]::new()
    $labels = [System.Collections.Generic.List[string]]::new()
    foreach ($assignment in $assignments) {
        $target = $assignment.target
        switch ($target.'@odata.type') {
            '#microsoft.graph.allDevicesAssignmentTarget' { $keys.Add('AllDevices'); $labels.Add('All devices') }
            '#microsoft.graph.allLicensedUsersAssignmentTarget' { $keys.Add('AllUsers'); $labels.Add('All users') }
            '#microsoft.graph.groupAssignmentTarget' { $keys.Add([string]$target.groupId); $labels.Add((Get-JlIntuneGroupName -GroupId $target.groupId)) }
            '#microsoft.graph.exclusionGroupAssignmentTarget' { $labels.Add("Excluded: $(Get-JlIntuneGroupName -GroupId $target.groupId)") }
        }
    }
    @{
        IsAssigned = $keys.Count -gt 0
        Keys       = @($keys)
        Targets    = $(if ($labels.Count -gt 0) { $labels -join '; ' } else { 'Not assigned' })
    }
}
