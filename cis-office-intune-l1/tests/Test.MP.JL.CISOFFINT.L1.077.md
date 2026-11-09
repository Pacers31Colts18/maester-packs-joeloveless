#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.23.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Miscellaneous > Block signing into Office** to **Enabled**, with **Block signing into Office** set to **Org ID only** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Miscellaneous** > **Block signing into Office** and set it to **Enabled**, then set **Block signing into Office** to **Org ID only**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
