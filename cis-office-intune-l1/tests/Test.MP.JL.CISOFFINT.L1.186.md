#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.6.6.6.2.1.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft PowerPoint 2016 > PowerPoint Options > Security > Trust Center > File Block Settings > PowerPoint 97-2003 presentations, shows, templates and add-in files** to **Enabled**, with **File block setting** set to **Open/Save blocked, use open policy** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft PowerPoint 2016** > **PowerPoint Options** > **Security** > **Trust Center** > **File Block Settings** > **PowerPoint 97-2003 presentations, shows, templates and add-in files** and set it to **Enabled**, then set **File block setting** to **Open/Save blocked, use open policy**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
