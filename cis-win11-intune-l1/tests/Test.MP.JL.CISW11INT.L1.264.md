#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 99.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Windows Ink Workspace > Allow Windows Ink Workspace** to **Disabled, or enabled but not above the lock screen**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Windows Ink Workspace** > **Allow Windows Ink Workspace** and set it to **Disabled, or enabled but not above the lock screen**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-WindowsInkWorkspace#allowwindowsinkworkspace)

<!--- Results --->
%TestResult%
