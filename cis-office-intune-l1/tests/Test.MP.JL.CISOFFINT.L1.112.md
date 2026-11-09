#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.1.6.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Account Settings > RSS Feeds > Download full text of articles as HTML attachments** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Account Settings** > **RSS Feeds** > **Download full text of articles as HTML attachments** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
