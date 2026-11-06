function Test-JLLockedEnrollment {
    [MaesterTest(
        Id           = 'MP.JL.CISMACINT.L1.090',
        Title        = 'Locked enrollment is set to Yes',
        Product      = 'Intune',
        Feature      = 'CIS Apple MacOS 26 Tahoe Intune Benchark (L1)',
        Area         = 'Enrollment',
        ResourceType = 'Policy',
        Severity     = 'High',
        Control      = 'cis-intune-macos26-l1:2.13.1',
        Service      = 'Graph',
        License      = 'INTUNE_A',
        Permission   = 'Graph:Scope:DeviceManagementConfiguration.Read.All',
        Author       = 'Pacers31Colts18'
    )]
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        # Why the pack can't check this recommendation; the report shows it as the skip reason.
        [string] $SkipReason = 'Locked enrollment is set on the Apple Business Manager enrollment profile, which this pack does not read'
    )

    Add-MtTestResultDetail -SkippedBecause Custom -SkippedCustomReason $SkipReason
    return $null
}
