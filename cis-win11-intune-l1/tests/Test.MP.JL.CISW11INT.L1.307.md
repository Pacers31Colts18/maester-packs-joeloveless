#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 106.2.1.4 (Level 1).

The test passes when an assigned compliance policy sets **Antispyware** to **Require**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Compliance** and open (or create)
   the compliance policy.
2. Set **Antispyware** to **Require**.
3. Assign the policy to your devices, and remove any other assigned compliance policy that sets it to something else.

<!--- Results --->
%TestResult%
