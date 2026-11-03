#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 49.18 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Local Policies Security Options > Network Access Restrict Clients Allowed To Make Remote Calls To SAM** to **O:BAG:BAD:(A;;RC;;;BA)**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Local Policies Security Options** > **Network Access Restrict Clients Allowed To Make Remote Calls To SAM** and set it to **O:BAG:BAD:(A;;RC;;;BA)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-LocalPoliciesSecurityOptions#networkaccess_restrictclientsallowedtomakeremotecallstosam)

<!--- Results --->
%TestResult%
