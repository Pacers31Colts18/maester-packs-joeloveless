#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.6.18.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Network > Windows Connection Manager > Minimize the number of simultaneous connections to the Internet or a Windows Domain** to **Enabled**, with **Minimize Policy Options** set to **3 = Prevent Wi-Fi when on Ethernet** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Network** > **Windows Connection Manager** > **Minimize the number of simultaneous connections to the Internet or a Windows Domain** and set it to **Enabled**, then set **Minimize Policy Options** to **3 = Prevent Wi-Fi when on Ethernet**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-wcm#admx-wcm-wcm-minimizeconnections)

<!--- Results --->
%TestResult%
