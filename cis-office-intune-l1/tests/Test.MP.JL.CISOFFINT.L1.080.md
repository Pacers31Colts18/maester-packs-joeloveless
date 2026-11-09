#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.24.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Office 2016 Converters > Block opening of pre-release versions of file formats new to PowerPoint 2016 through the Compatibility Pack for Office 2016 and PowerPoint 2016 Converter** to **Enabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Office 2016 Converters** > **Block opening of pre-release versions of file formats new to PowerPoint 2016 through the Compatibility Pack for Office 2016 and PowerPoint 2016 Converter** and set it to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
