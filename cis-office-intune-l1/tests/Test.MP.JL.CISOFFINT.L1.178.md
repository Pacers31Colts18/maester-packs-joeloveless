#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.6.6.6.5 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft PowerPoint 2016 > PowerPoint Options > Security > Scan encrypted macros in PowerPoint Open XML presentations** to **Enabled**, with **Scan encrypted macros in PowerPoint Open XML presentations** set to **Scan encrypted macros (default)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft PowerPoint 2016** > **PowerPoint Options** > **Security** > **Scan encrypted macros in PowerPoint Open XML presentations** and set it to **Enabled**, then set **Scan encrypted macros in PowerPoint Open XML presentations** to **Scan encrypted macros (default)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
