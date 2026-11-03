#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.6.11.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Network > Network Provider > Hardened UNC Paths** to **Enabled**, with **Name** set to **\\\\\*\\NETLOGON and \\\\\*\\SYSVOL** and **Value** set to **RequireIntegrity=1,RequireMutualAuthentication=1,RequirePrivacy=1** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Network** > **Network Provider** > **Hardened UNC Paths** and set it to **Enabled**, then set **Name** to **\\\\\*\\NETLOGON and \\\\\*\\SYSVOL** and **Value** to **RequireIntegrity=1,RequireMutualAuthentication=1,RequirePrivacy=1**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-connectivity#connectivity-hardeneduncpaths)

<!--- Results --->
%TestResult%
