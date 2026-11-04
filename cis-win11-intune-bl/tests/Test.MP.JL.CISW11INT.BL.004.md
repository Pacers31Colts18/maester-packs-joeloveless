#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.7.5 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > BitLocker Drive Encryption > Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later)** to **Enabled**, with **Select the encryption method for operating system drives** set to **XTS-AES 128-bit or XTS-AES 256-bit** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **BitLocker Drive Encryption** > **Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later)** and set it to **Enabled**, then set **Select the encryption method for operating system drives** to **XTS-AES 128-bit or XTS-AES 256-bit**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/bitlocker-csp#encryptionmethodbydrivetype)

<!--- Results --->
%TestResult%
