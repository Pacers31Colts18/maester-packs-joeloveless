#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.5.3 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > MSS (Legacy) > MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)** to **Enabled**, with **DisableIPSourceRouting** set to **Highest protection, source routing is completely disabled** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **MSS (Legacy)** > **MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)** and set it to **Enabled**, then set **DisableIPSourceRouting** to **Highest protection, source routing is completely disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-msslegacy#msslegacy-ipsourceroutingprotectionlevel)

<!--- Results --->
%TestResult%
