#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.7.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Printers > Allow Print Spooler to accept client connections** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Printers** > **Allow Print Spooler to accept client connections** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-printing2#admx-printing2-registerspoolerremoterpcendpoint)

<!--- Results --->
%TestResult%
