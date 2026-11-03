#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.4.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > MS Security Guide > Configure SMB v1 client driver** to **Enabled**, with **Configure MrxSmb10 driver** set to **Disable driver (recommended)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **MS Security Guide** > **Configure SMB v1 client driver** and set it to **Enabled**, then set **Configure MrxSmb10 driver** to **Disable driver (recommended)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-mssecurityguide#mssecurityguide-configuresmbv1clientdriver)

<!--- Results --->
%TestResult%
