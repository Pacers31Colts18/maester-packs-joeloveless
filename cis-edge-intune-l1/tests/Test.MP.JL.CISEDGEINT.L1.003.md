#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.4.3 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Content settings > Control use of insecure content exceptions** to **Enabled**, with **Control use of insecure content exceptions** set to **Do not allow any site to load blockable mixed content** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Content settings** > **Control use of insecure content exceptions** and set it to **Enabled**, then set **Control use of insecure content exceptions** to **Do not allow any site to load blockable mixed content**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
