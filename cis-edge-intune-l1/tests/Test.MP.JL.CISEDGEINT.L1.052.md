#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.74 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Configure the list of types that are excluded from synchronization** to **Enabled**, with **Configure the list of types that are excluded from synchronization** set to **passwords** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Configure the list of types that are excluded from synchronization** and set it to **Enabled**, then set **Configure the list of types that are excluded from synchronization** to **passwords**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
