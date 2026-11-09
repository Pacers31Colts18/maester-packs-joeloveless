#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.27.13 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Security Settings > Encryption type for password protected Office 97-2003 files** to **Enabled**, with **Encryption type** set to **Microsoft Enhanced RSA and AES Cryptographic Provider,AES 256,256** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Security Settings** > **Encryption type for password protected Office 97-2003 files** and set it to **Enabled**, then set **Encryption type** to **Microsoft Enhanced RSA and AES Cryptographic Provider,AES 256,256**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
