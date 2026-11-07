#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 3.3.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge Update > Preferences > Auto-update check period override** to **Enabled**, with **Minutes between update checks** set to **any value except 0** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge Update** > **Preferences** > **Auto-update check period override** and set it to **Enabled**, then set **Minutes between update checks** to **any value except 0**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
