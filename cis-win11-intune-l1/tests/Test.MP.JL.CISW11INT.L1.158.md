#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 37.20 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Firewall > Enable Public Network Firewall** to **True**, with **Enable Log Dropped Packets** set to **Enable Logging Of Dropped Packets** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Firewall** > **Enable Public Network Firewall** and set it to **True**, then set **Enable Log Dropped Packets** to **Enable Logging Of Dropped Packets**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/firewall-csp)

<!--- Results --->
%TestResult%
