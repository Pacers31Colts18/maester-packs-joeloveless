#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 49.28 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Local Policies Security Options > User Account Control Only Elevate UI Access Applications That Are Installed In Secure Locations** to **Enabled: Application runs with UIAccess integrity only if it resides in secure location.**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Local Policies Security Options** > **User Account Control Only Elevate UI Access Applications That Are Installed In Secure Locations** and set it to **Enabled: Application runs with UIAccess integrity only if it resides in secure location.**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-LocalPoliciesSecurityOptions#useraccountcontrol_onlyelevateuiaccessapplicationsthatareinstalledinsecurelocations)

<!--- Results --->
%TestResult%
