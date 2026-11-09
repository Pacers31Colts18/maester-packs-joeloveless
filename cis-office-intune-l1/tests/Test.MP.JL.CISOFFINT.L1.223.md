#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.11.8.7.2.2.4 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Word 2016 > Word Options > Security > Trust Center > Protected View > Set document behavior if file validation fails** to **Enabled**, with **Allow edit** set to **Do not allow edit** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Word 2016** > **Word Options** > **Security** > **Trust Center** > **Protected View** > **Set document behavior if file validation fails** and set it to **Enabled**, then set **Allow edit** to **Do not allow edit**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
