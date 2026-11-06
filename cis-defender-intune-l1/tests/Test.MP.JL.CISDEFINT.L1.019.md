#### Description

CIS Intune for Microsoft Defender Antivirus Benchmark, recommendation 2.15 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Defender > ASR: Block executable files from running unless they meet a prevalence, age, or trusted list criterion** to **Audit or Block**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Defender** > **ASR: Block executable files from running unless they meet a prevalence, age, or trusted list criterion** and set it to **Audit or Block**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-atp/attack-surface-reduction)

<!--- Results --->
%TestResult%
