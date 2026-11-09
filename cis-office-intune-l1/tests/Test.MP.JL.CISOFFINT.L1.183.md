#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.6.6.6.2.6 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft PowerPoint 2016 > PowerPoint Options > Security > Trust Center > Require that application add-ins are signed by Trusted Publisher** to **Enabled**, with **Disable Trust Bar Notification for unsigned application add-ins and block them** set to **Enabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft PowerPoint 2016** > **PowerPoint Options** > **Security** > **Trust Center** > **Require that application add-ins are signed by Trusted Publisher** and set it to **Enabled**, then set **Disable Trust Bar Notification for unsigned application add-ins and block them** to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
