#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.10.13.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > System > Early Launch Antimalware > Boot-Start Driver Initialization Policy** to **Enabled**, with **Choose the boot-start drivers that can be initialized** set to **Good, unknown and bad but critical** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **System** > **Early Launch Antimalware** > **Boot-Start Driver Initialization Policy** and set it to **Enabled**, then set **Choose the boot-start drivers that can be initialized** to **Good, unknown and bad but critical**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-system#system-bootstartdriverinitialization)

<!--- Results --->
%TestResult%
