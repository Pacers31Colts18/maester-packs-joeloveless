#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.10.4 (Level 1).

The test passes when an assigned settings catalog policy for macOS sets **Declarative Device Management (DDM) > Software Update Settings > Allow Standard User OS Updates** to **Allowed**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for macOS.
2. Add **Declarative Device Management (DDM)** > **Software Update Settings** > **Allow Standard User OS Updates** and set it to **Allowed**.
3. Assign the policy to your macOS devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
