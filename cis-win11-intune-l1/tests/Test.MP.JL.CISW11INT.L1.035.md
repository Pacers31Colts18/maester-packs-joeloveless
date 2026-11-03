#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.10.5.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > System > Credentials Delegation > Encryption Oracle Remediation** to **Enabled**, with **Protection Level** set to **Force Updated Clients** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **System** > **Credentials Delegation** > **Encryption Oracle Remediation** and set it to **Enabled**, then set **Protection Level** to **Force Updated Clients**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-credssp#admx-credssp-allowencryptionoracle)

<!--- Results --->
%TestResult%
