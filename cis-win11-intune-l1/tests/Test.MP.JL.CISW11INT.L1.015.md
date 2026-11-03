#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.5.12 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > MSS (Legacy) > MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning** to **Enabled**, with **WarningLevel** set to **90% or less** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **MSS (Legacy)** > **MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning** and set it to **Enabled**, then set **WarningLevel** to **90% or less**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-admx-mss-legacy#admx-mss-legacy-pol-mss-warninglevel)

<!--- Results --->
%TestResult%
