#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.3.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Certificate management settings > Allow users to manage installed CA certificates** to **Enabled**, with **Allow users to manage installed CA certificates** set to **Disallow users from managing certificates** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Certificate management settings** > **Allow users to manage installed CA certificates** and set it to **Enabled**, then set **Allow users to manage installed CA certificates** to **Disallow users from managing certificates**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
