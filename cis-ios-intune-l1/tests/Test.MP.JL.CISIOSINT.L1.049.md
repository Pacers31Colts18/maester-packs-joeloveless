#### Description

CIS Apple iOS 26 and iPadOS 26 Intune Benchmark, recommendation 3.10.2 (Level 1).

This test is always skipped: This is set on the Apple Business Manager enrollment profile, which this pack does not read. Check **Sync with computers** on the devices, or in the results of the script that sets it.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **iOS/iPadOS** > **iOS/iPadOS enrollment** > **Enrollment program tokens**, open your token, then **Profiles**.
2. Open the profile assigned to your devices and set **Sync with computers** to **Deny All**.

<!--- Results --->
%TestResult%
