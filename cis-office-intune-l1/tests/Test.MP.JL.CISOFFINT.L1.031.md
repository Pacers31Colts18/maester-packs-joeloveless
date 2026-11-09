#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.2.4.6.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Excel 2016 > Excel Options > Save > Default file format** to **Enabled**, with **Save Excel files as** set to **Excel Workbook (\*.xlsx)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Excel 2016** > **Excel Options** > **Save** > **Default file format** and set it to **Enabled**, then set **Save Excel files as** to **Excel Workbook (\*.xlsx)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
