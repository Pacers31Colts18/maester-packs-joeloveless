#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.61 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Automatically import another browser's data and settings at first run** to **Enabled**, with **Automatically import another browser's data and settings at first run** set to **Disables automatic import, and the import section of the first-run experience is skipped** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Automatically import another browser's data and settings at first run** and set it to **Enabled**, then set **Automatically import another browser's data and settings at first run** to **Disables automatic import, and the import section of the first-run experience is skipped**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
