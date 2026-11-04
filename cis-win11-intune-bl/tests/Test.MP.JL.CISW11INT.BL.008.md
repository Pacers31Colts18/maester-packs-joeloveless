#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.10.9.1.2 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > System > Device Installation > Device Installation Restrictions > Prevent installation of devices using drivers that match these device setup classes** to **Enabled**, with **Also apply to matching devices that are already installed.** set to **TRUE** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **System** > **Device Installation** > **Device Installation Restrictions** > **Prevent installation of devices using drivers that match these device setup classes** and set it to **Enabled**, then set **Also apply to matching devices that are already installed.** to **TRUE**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-deviceinstallation)

<!--- Results --->
%TestResult%
