#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.8.4.2 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Publisher 2016 > Security > Publisher Automation Security Level** to **Enabled**, with **Publisher Automation Security Level** set to **By UI (prompted)** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Publisher 2016** > **Security** > **Publisher Automation Security Level** and set it to **Enabled**, then set **Publisher Automation Security Level** to **By UI (prompted)**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
