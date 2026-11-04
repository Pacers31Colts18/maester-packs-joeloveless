#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.13.1 (Level 1).

This test is always skipped: Locked enrollment is set on the Apple Business Manager enrollment profile, which this pack does not read. Check **Locked enrollment** on the devices, or in the results of the script that sets it.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **macOS** > **Enrollment** > **Enrollment program tokens**, open your token, then **Profiles**.
2. Set **Locked enrollment** to **Yes** on the profile assigned to your Macs.

<!--- Results --->
%TestResult%
