#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 1.2.5.1.10 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 (Machine) > Security Settings > IE Security > Protection From Zone Elevation** to **Enabled**, with **excel.exe** set to **TRUE** and **exprwd.exe** set to **TRUE** and **groove.exe** set to **TRUE** and **msaccess.exe** set to **TRUE** and **mse7.exe** set to **TRUE** and **mspub.exe** set to **TRUE** and **onent.exe** set to **TRUE** and **outlook.exe** set to **TRUE** and **powerpnt.exe** set to **TRUE** and **pptview.exe** set to **TRUE** and **spDesign.exe** set to **TRUE** and **visio.exe** set to **TRUE** and **winproj.exe** set to **TRUE** and **winword.exe** set to **TRUE** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016 (Machine)** > **Security Settings** > **IE Security** > **Protection From Zone Elevation** and set it to **Enabled**, then set **excel.exe** to **TRUE** and **exprwd.exe** to **TRUE** and **groove.exe** to **TRUE** and **msaccess.exe** to **TRUE** and **mse7.exe** to **TRUE** and **mspub.exe** to **TRUE** and **onent.exe** to **TRUE** and **outlook.exe** to **TRUE** and **powerpnt.exe** to **TRUE** and **pptview.exe** to **TRUE** and **spDesign.exe** to **TRUE** and **visio.exe** to **TRUE** and **winproj.exe** to **TRUE** and **winword.exe** to **TRUE**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
