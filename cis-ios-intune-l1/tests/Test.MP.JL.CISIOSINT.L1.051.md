#### Description

CIS Apple iOS 26 and iPadOS 26 Intune Benchmark, recommendation 4.2 (Level 1).

The test passes when an assigned compliance policy sets **Compliance > Device Properties > Minimum OS version** to any value, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Compliance** and open (or create)
   the compliance policy.
2. Set **Compliance** > **Device Properties** > **Minimum OS version** to any value.
3. Assign the policy to your devices, and remove any other assigned compliance policy that sets it to something else.

<!--- Results --->
%TestResult%
