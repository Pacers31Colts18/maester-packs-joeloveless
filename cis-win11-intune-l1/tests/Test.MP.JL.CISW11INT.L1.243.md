#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 90.21 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **User Rights > Increase Scheduling Priority** to a value that is `in` **\*S-1-5-32-544, \*S-1-5-90-0**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **User Rights** > **Increase Scheduling Priority** and set it to a value that is `in` **\*S-1-5-32-544, \*S-1-5-90-0**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-UserRights#increaseschedulingpriority)

<!--- Results --->
%TestResult%
