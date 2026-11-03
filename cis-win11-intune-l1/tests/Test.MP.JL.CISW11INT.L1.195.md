#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 49.22 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Local Policies Security Options > Network Security Minimum Session Security For NTLMSSP Based Clients** to **Require NTLM and 128-bit encryption**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Local Policies Security Options** > **Network Security Minimum Session Security For NTLMSSP Based Clients** and set it to **Require NTLM and 128-bit encryption**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-LocalPoliciesSecurityOptions#networksecurity_minimumsessionsecurityforntlmsspbasedclients)

<!--- Results --->
%TestResult%
