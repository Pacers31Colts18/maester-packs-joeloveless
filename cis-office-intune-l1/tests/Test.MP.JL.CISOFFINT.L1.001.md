#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 1.1.1.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > MS Security Guide > Block Flash activation in Office documents** to **Enabled**, with **Block Flash player in Office** set to **Block all activation** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **MS Security Guide** > **Block Flash activation in Office documents** and set it to **Enabled**, then set **Block Flash player in Office** to **Block all activation**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
