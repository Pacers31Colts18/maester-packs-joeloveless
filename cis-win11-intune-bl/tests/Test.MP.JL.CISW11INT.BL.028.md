#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.7.3.2 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > BitLocker Drive Encryption > Removable Data Drives > Deny write access to removable drives not protected by BitLocker** to **Enabled**, with **Do not allow write access to devices configured in another organization** set to **FALSE** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Removable Data Drives** > **Deny write access to removable drives not protected by BitLocker** and set it to **Enabled**, then set **Do not allow write access to devices configured in another organization** to **FALSE**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/bitlocker-csp)

<!--- Results --->
%TestResult%
