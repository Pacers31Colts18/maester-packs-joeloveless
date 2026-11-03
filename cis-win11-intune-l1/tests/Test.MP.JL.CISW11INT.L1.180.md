#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 49.6 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Local Policies Security Options > Interactive Logon Do Not Display Last Signed In** to **Enabled (username will not be shown)**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Local Policies Security Options** > **Interactive Logon Do Not Display Last Signed In** and set it to **Enabled (username will not be shown)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-LocalPoliciesSecurityOptions#interactivelogon_donotdisplaylastsignedin)

<!--- Results --->
%TestResult%
