#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 104.3 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Windows Update For Business > Manage Preview Builds** to **Disable Preview builds**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Windows Update For Business** > **Manage Preview Builds** and set it to **Disable Preview builds**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-Update#managepreviewbuilds)

<!--- Results --->
%TestResult%
