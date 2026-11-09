#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.11.8.6.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Word 2016 > Word Options > Save > Default file format** to **Enabled**, with **Save Word files as** set to **Word Document (\*.docx)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Word 2016** > **Word Options** > **Save** > **Default file format** and set it to **Enabled**, then set **Save Word files as** to **Word Document (\*.docx)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
