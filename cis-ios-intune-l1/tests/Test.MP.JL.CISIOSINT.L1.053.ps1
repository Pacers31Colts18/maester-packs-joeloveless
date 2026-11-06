function Test-JLDeviceComplianceStatus {
    [MaesterTest(
        Id           = 'MP.JL.CISIOSINT.L1.053',
        Title        = 'Device compliance status is set to Compliant',
        Product      = 'Intune',
        Feature      = 'CIS Apple iOS 26 and iPadOS 26 Intune Benchmark (L1)',
        Area         = 'Compliance',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-ios26-supl1:4.5',
        Service      = 'Graph',
        License      = 'INTUNE_A',
        Permission   = 'Graph:Scope:DeviceManagementConfiguration.Read.All',
        Author       = 'Pacers31Colts18'
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        # Why the pack can't check this recommendation; the report shows it as the skip reason.
        [string] $SkipReason = 'This is the compliance state of each device, and this pack reads configuration, not device state'
    )

    Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason $SkipReason
    return $null
}
