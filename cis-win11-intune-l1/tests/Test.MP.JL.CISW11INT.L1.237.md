#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 90.15 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **User Rights > Deny Log On As Batch Job** to a list that includes **Guests**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **User Rights** > **Deny Log On As Batch Job** and set it to a list that includes **Guests**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-UserRights#denylogonasbatchjob)

<!--- Results --->
%TestResult%
