#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.35 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > Hide Exclusions From Local Users** to **Enabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **Hide Exclusions From Local Users** and set it to **Enabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/Defender-csp/)

<!--- Results --->
%TestResult%
