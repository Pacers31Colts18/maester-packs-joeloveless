#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.70 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Configure InPrivate mode availability** to **Enabled**, with **Configure InPrivate mode availability** set to **InPrivate mode disabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Configure InPrivate mode availability** and set it to **Enabled**, then set **Configure InPrivate mode availability** to **InPrivate mode disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
