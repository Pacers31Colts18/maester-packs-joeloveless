#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.23.3 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Miscellaneous > Control Blogging** to **Enabled**, with **Control Blogging** set to **All blogging disabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Miscellaneous** > **Control Blogging** and set it to **Enabled**, then set **Control Blogging** to **All blogging disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
