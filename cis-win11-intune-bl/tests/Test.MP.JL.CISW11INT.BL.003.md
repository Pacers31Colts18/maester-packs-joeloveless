#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 8.3 (BL).

The test passes when an assigned settings catalog policy for Windows sets **BitLocker > Allow Warning For Other Disk Encryption** to **Disabled**, with **Allow Standard User Encryption** set to **Enabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **BitLocker** > **Allow Warning For Other Disk Encryption** and set it to **Disabled**, then set **Allow Standard User Encryption** to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/bitlocker-csp#allowwarningforotherdiskencryption)

<!--- Results --->
%TestResult%
