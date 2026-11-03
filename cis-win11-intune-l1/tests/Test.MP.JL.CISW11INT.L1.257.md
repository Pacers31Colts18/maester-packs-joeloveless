#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 91.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Virtualization Based Technology > Hypervisor Enforced Code Integrity** to **(Enabled with UEFI lock) Turns on Hypervisor-Protected Code Integrity with UEFI lock.**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Virtualization Based Technology** > **Hypervisor Enforced Code Integrity** and set it to **(Enabled with UEFI lock) Turns on Hypervisor-Protected Code Integrity with UEFI lock.**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-VirtualizationBasedTechnology#hypervisorenforcedcodeintegrity)

<!--- Results --->
%TestResult%
