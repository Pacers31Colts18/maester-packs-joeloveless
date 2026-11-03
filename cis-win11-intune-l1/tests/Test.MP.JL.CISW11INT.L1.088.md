#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.35.4.9.3 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Security > Require use of specific security layer for remote (RDP) connections** to **Enabled**, with **Security Layer** set to **SSL** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **Remote Desktop Services** > **Remote Desktop Session Host** > **Security** > **Require use of specific security layer for remote (RDP) connections** and set it to **Enabled**, then set **Security Layer** to **SSL**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-terminalserver#admx-terminalserver-ts-security-layer-policy)

<!--- Results --->
%TestResult%
