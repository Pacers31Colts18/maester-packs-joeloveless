#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.47 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Submit Samples Consent** to **Send safe samples or all samples automatically**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Submit Samples Consent** and set it to **Send safe samples or all samples automatically**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender)

<!--- Results --->
%TestResult%
