#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.2.4.7.6 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Excel 2016 > Excel Options > Security > WEBSERVICE Function Notification Settings** to **Enabled**, with **WEBSERVICE Function Notification Settings** set to **Disable all with notification or Disable all without notification** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Excel 2016** > **Excel Options** > **Security** > **WEBSERVICE Function Notification Settings** and set it to **Enabled**, then set **WEBSERVICE Function Notification Settings** to **Disable all with notification or Disable all without notification**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
