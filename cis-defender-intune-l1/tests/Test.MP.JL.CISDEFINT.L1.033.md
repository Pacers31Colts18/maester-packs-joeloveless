#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.29 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Cloud Extended Timeout** to **1** or more, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Cloud Extended Timeout** and set it to **1** or more.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender)

<!--- Results --->
%TestResult%
