#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.10.6.1.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Outlook Options > Other > Advanced > Do not allow folders in non-default stores to be set as folder home pages** to **Enabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Outlook Options** > **Other** > **Advanced** > **Do not allow folders in non-default stores to be set as folder home pages** and set it to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
