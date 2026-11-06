#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.8.38 (Level 1).

The test passes when an assigned settings catalog policy for macOS sets **Restrictions > Allow iTunes File Sharing** to **False**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for macOS.
2. Add **Restrictions** > **Allow iTunes File Sharing** and set it to **False**.
3. Assign the policy to your macOS devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
