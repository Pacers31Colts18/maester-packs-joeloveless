#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.3.1.5 (Level 1).

The test passes when an assigned settings catalog policy for macOS sets **Full Disk Encryption > FileVault > Force Enable In Setup Assistant** to **True**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for macOS.
2. Add **Full Disk Encryption** > **FileVault** > **Force Enable In Setup Assistant** and set it to **True**.
3. Assign the policy to your macOS devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
