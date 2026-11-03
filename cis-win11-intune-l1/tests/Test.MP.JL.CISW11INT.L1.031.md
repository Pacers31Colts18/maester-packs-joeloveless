#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.7.9 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Printers > Manage processing of Queue-specific files** to **Enabled**, with **Manage processing of Queue-Specific files** set to **Limit Queue-specific files to Color profiles** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Printers** > **Manage processing of Queue-specific files** and set it to **Enabled**, then set **Manage processing of Queue-Specific files** to **Limit Queue-specific files to Color profiles**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-printers#printers-configurecopyfilespolicy)

<!--- Results --->
%TestResult%
