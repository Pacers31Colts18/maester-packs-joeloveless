#### Description

CIS Apple iOS 26 and iPadOS 26 Intune Benchmark, recommendation 3.2.1 (Level 1).

The test passes when an assigned configuration profile sets **Device Restrictions > Built-in Apps > Block Siri while device is locked** to **Yes**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open the
   configuration profile.
2. Set **Device Restrictions** > **Built-in Apps** > **Block Siri while device is locked** to **Yes**.
3. Assign the profile to your devices, and remove any other assigned profile that sets it to something else.

<!--- Results --->
%TestResult%
