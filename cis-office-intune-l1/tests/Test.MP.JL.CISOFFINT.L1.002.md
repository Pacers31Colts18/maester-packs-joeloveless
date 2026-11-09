#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 1.1.1.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > MS Security Guide > Restrict legacy JScript execution for Office** to **Enabled**, with **Access** set to **69632** and **Excel** set to **69632** and **OneNote** set to **69632** and **Outlook** set to **69632** and **PowerPoint** set to **69632** and **Project** set to **69632** and **Publisher** set to **69632** and **Visio** set to **69632** and **Word** set to **69632** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **MS Security Guide** > **Restrict legacy JScript execution for Office** and set it to **Enabled**, then set **Access** to **69632** and **Excel** to **69632** and **OneNote** to **69632** and **Outlook** to **69632** and **PowerPoint** to **69632** and **Project** to **69632** and **Publisher** to **69632** and **Visio** to **69632** and **Word** to **69632**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
