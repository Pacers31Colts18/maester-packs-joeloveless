#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.7.2.9 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > BitLocker Drive Encryption > Operating System Drives > Enforce drive encryption type on operating system drives** to **Enabled**, with **Select the encryption type** set to **Full encryption or Used Space Only encryption** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Operating System Drives** > **Enforce drive encryption type on operating system drives** and set it to **Enabled**, then set **Select the encryption type** to **Full encryption or Used Space Only encryption**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/BitLocker-csp/)

<!--- Results --->
%TestResult%
