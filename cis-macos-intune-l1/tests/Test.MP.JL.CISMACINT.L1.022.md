#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.9.1.5 (Level 1).

The test passes when an assigned settings catalog policy for macOS sets **Declarative Device Management (DDM) > Passcode > Passcode Reuse Limit** to **24** or more, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for macOS.
2. Add **Declarative Device Management (DDM)** > **Passcode** > **Passcode Reuse Limit** and set it to **24** or more.
3. Assign the policy to your macOS devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
