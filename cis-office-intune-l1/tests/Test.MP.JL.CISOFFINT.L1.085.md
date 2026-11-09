#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.3.27.8 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Office 2016 > Security Settings > Control how Office handles form-based sign-in prompts** to **Enabled**, with **Behavior** set to **Block all prompts** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Office 2016** > **Security Settings** > **Control how Office handles form-based sign-in prompts** and set it to **Enabled**, then set **Behavior** to **Block all prompts**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
