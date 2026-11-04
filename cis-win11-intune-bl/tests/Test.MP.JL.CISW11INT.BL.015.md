#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.7.1.5 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > BitLocker Drive Encryption > Fixed Data Drives > Choose how BitLocker-protected fixed drives can be recovered** to **Enabled**, with **Configure storage of BitLocker recovery information to AD DS** set to **Backup recovery passwords only** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Fixed Data Drives** > **Choose how BitLocker-protected fixed drives can be recovered** and set it to **Enabled**, then set **Configure storage of BitLocker recovery information to AD DS** to **Backup recovery passwords only**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/bitlocker-csp)

<!--- Results --->
%TestResult%
