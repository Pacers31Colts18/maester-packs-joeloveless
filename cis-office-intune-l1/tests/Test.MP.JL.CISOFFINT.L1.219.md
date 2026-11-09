#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.11.8.7.2.1.9 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Word 2016 > Word Options > Security > Trust Center > File Block Settings > Word XP binary documents and templates** to **Enabled**, with **File block setting** set to **Open/Save blocked, use open policy** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Word 2016** > **Word Options** > **Security** > **Trust Center** > **File Block Settings** > **Word XP binary documents and templates** and set it to **Enabled**, then set **File block setting** to **Open/Save blocked, use open policy**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
