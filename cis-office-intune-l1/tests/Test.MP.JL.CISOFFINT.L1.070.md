#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.6.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Customize > Disable UI extending from documents and templates** to **Enabled**, with **Disallow in Access** set to **TRUE** and **Disallow in Excel** set to **TRUE** and **Disallow in InfoPath** set to **TRUE** and **Disallow in Outlook** set to **TRUE** and **Disallow in PowerPoint** set to **TRUE** and **Disallow in Project** set to **TRUE** and **Disallow in Publisher** set to **TRUE** and **Disallow in Visio** set to **TRUE** and **Disallow in Word** set to **TRUE** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Customize** > **Disable UI extending from documents and templates** and set it to **Enabled**, then set **Disallow in Access** to **TRUE** and **Disallow in Excel** to **TRUE** and **Disallow in InfoPath** to **TRUE** and **Disallow in Outlook** to **TRUE** and **Disallow in PowerPoint** to **TRUE** and **Disallow in Project** to **TRUE** and **Disallow in Publisher** to **TRUE** and **Disallow in Visio** to **TRUE** and **Disallow in Word** to **TRUE**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
