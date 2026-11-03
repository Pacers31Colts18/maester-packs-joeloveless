#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.11.18.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > Windows Components > File Explorer > Configure Windows Defender SmartScreen** to **Enabled**, with **Pick one of the following settings** set to **Warn and prevent bypass** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **Windows Components** > **File Explorer** > **Configure Windows Defender SmartScreen** and set it to **Enabled**, then set **Pick one of the following settings** to **Warn and prevent bypass**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-windowsexplorer#admx-windowsexplorer-enablesmartscreen)

<!--- Results --->
%TestResult%
