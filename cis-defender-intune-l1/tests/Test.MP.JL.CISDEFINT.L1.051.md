#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.49 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Remediation action for High severity threats** to **Quarantine or Remove**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Remediation action for High severity threats** and set it to **Quarantine or Remove**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
