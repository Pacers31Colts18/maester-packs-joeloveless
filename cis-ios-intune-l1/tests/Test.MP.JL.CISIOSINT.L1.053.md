#### Description

CIS Apple iOS 26 and iPadOS 26 Intune Benchmark, recommendation 4.5 (Level 1).

This test is always skipped: This is the compliance state of each device, and this pack reads configuration, not device state. Check **Device compliance status** on the devices, or in the results of the script that sets it.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Compliance**, open the compliance policy, then **Device status**.
2. Remove each device that is not compliant, or bring it into line with the policy.

<!--- Results --->
%TestResult%
