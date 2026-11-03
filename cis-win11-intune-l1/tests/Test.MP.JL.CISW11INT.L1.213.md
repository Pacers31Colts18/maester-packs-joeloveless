#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 69.4 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Privacy > Let Apps Activate With Voice Above Lock** to **Force deny. Windows apps cannot be activated by voice while the screen is locked, and users cannot change it.**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Privacy** > **Let Apps Activate With Voice Above Lock** and set it to **Force deny. Windows apps cannot be activated by voice while the screen is locked, and users cannot change it.**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-Privacy#letappsactivatewithvoiceabovelock)

<!--- Results --->
%TestResult%
