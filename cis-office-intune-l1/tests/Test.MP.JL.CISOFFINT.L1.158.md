#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.14.3.17 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Security > Security Form Settings > Outlook Security Mode** to **Enabled**, with **Do not allow Outlook object model scripts to run for public folders** set to **Enabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Security** > **Security Form Settings** > **Outlook Security Mode** and set it to **Enabled**, then set **Do not allow Outlook object model scripts to run for public folders** to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
