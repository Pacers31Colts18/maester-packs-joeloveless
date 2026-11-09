#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.1.4.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Access 2016 > Miscellaneous > Default file format** to **Enabled**, with **Default file format** set to **Access 2007** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Access 2016** > **Miscellaneous** > **Default file format** and set it to **Enabled**, then set **Default file format** to **Access 2007**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
