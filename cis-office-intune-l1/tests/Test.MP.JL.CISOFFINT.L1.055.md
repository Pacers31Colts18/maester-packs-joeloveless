#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.2.4.7.2.2.7 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Excel 2016 > Excel Options > Security > Trust Center > File Block Settings > Excel 4 macrosheets and add-in files** to **Enabled**, with **File block setting** set to **Open/Save blocked, use open policy** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Excel 2016** > **Excel Options** > **Security** > **Trust Center** > **File Block Settings** > **Excel 4 macrosheets and add-in files** and set it to **Enabled**, then set **File block setting** to **Open/Save blocked, use open policy**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
