#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.27 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Check For Signatures Before Running Scan** to **Enabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Check For Signatures Before Running Scan** and set it to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender)

<!--- Results --->
%TestResult%
