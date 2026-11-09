#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.11.8.7.2.8 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Word 2016 > Word Options > Security > Trust Center > Scan encrypted macros in Word Open XML documents** to **Enabled**, with **Scan encrypted macros in Word Open XML documents** set to **Scan encrypted macros (default)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Word 2016** > **Word Options** > **Security** > **Trust Center** > **Scan encrypted macros in Word Open XML documents** and set it to **Enabled**, then set **Scan encrypted macros in Word Open XML documents** to **Scan encrypted macros (default)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
