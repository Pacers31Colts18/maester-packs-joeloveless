#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.14.3.12 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Security > Security Form Settings > Outlook Security Mode** to **Enabled**, with **Configure Outlook object model prompt when executing Save As** set to **Enabled** and **Guard behavior** set to **Automatically Deny** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Security** > **Security Form Settings** > **Outlook Security Mode** and set it to **Enabled**, then set **Configure Outlook object model prompt when executing Save As** to **Enabled** and **Guard behavior** to **Automatically Deny**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
