#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.5.14.2.1.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Outlook 2016 > Security > Cryptography > Signature Status dialog box > Missing CRLs** to **Enabled**, with **Indicate a missing CRL as a(n)** set to **Error** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Outlook 2016** > **Security** > **Cryptography** > **Signature Status dialog box** > **Missing CRLs** and set it to **Enabled**, then set **Indicate a missing CRL as a(n)** to **Error**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
