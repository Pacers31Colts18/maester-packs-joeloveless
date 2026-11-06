#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.39 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Real Time Scan Direction** to **Monitor all files bi-directional**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Real Time Scan Direction** and set it to **Monitor all files bi-directional**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-Defender#realtimescandirection)

<!--- Results --->
%TestResult%
