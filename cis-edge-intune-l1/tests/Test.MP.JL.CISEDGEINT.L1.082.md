#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.114 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Enhance the security state in Microsoft Edge** to **Enabled**, with **Enhance the security state in Microsoft Edge** set to **Balanced mode or Strict mode** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Enhance the security state in Microsoft Edge** and set it to **Enabled**, then set **Enhance the security state in Microsoft Edge** to **Balanced mode or Strict mode**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
