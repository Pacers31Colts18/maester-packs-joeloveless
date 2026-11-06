#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.33 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Enable File Hash Computation** to **Enable**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Enable File Hash Computation** and set it to **Enable**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/Defender-csp/)

<!--- Results --->
%TestResult%
