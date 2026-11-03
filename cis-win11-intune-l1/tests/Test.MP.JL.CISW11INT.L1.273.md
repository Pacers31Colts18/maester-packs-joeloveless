#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 107.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **LAPS > Backup Directory** to **Backup the password to Microsoft Entra ID only**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **LAPS** > **Backup Directory** and set it to **Backup the password to Microsoft Entra ID only**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/LAPS-csp/)

<!--- Results --->
%TestResult%
