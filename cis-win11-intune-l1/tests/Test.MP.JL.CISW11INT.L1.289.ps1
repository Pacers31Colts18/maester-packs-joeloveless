function Test-JLSSDPDiscoverySSDPSRV {
    [MaesterTest(
        Id           = 'MP.JL.CISW11INT.L1.289',
        Title        = 'SSDP Discovery (SSDPSRV) is set to Disabled',
        Product      = 'Intune',
        Feature      = 'CIS Microsoft Intune for Windows 11 Benchmark (L1)',
        Area         = 'System Services',
        ResourceType = 'Policy',
        Severity     = 'Medium',
        Control      = 'cis-intune-win11-l1:82.27',
        Service      = 'Graph',
        License      = 'INTUNE_A',
        Permission   = 'Graph:Scope:DeviceManagementConfiguration.Read.All',
        Author       = 'Pacers31Colts18'
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        # Why the pack can't check this recommendation; the report shows it as the skip reason.
        [string] $SkipReason = 'Set by script outside the Intune Settings Catalog'
    )

    Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason $SkipReason
    return $null
}
