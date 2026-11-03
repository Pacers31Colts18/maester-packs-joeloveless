#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 37.11 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Firewall > Enable Private Network Firewall** to **True**, with **Enable Log Success Connections** set to **Enable Logging Of Successful Connections** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Firewall** > **Enable Private Network Firewall** and set it to **True**, then set **Enable Log Success Connections** to **Enable Logging Of Successful Connections**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/firewall-csp)

<!--- Results --->
%TestResult%
