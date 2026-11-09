#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.14.3.30 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Security > Security Form Settings > Outlook Security Mode** to **Enabled**, with **Signature Warning** set to **Enabled** and **Signature Warning** set to **Always warn about invalid signatures** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Security** > **Security Form Settings** > **Outlook Security Mode** and set it to **Enabled**, then set **Signature Warning** to **Enabled** and **Signature Warning** to **Always warn about invalid signatures**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
