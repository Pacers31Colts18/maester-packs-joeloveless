#### Description

CIS Apple MacOS 26 Tahoe Intune Benchark, recommendation 2.11.1.1 (Level 1).

The test passes when assigned settings catalog policies for macOS set each of **System Configuration > Energy Saver > Display Sleep Timer**, **System Configuration > Energy Saver > Display Sleep Timer** and **System Configuration > Energy Saver > Display Sleep Timer** to **10 or less, but not 0**, and no other assigned policy sets one of them to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for macOS.
2. Add **System Configuration** > **Energy Saver** > **Display Sleep Timer**, **System Configuration** > **Energy Saver** > **Display Sleep Timer** and **System Configuration** > **Energy Saver** > **Display Sleep Timer** and set each to **10 or less, but not 0**.
3. Assign the policy to your macOS devices, and remove any other assigned policy that sets one of them to something else.

<!--- Results --->
%TestResult%
