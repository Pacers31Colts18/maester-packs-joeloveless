#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.4.10 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Content settings > Default geolocation setting** to **Enabled**, with **Default geolocation setting** set to **Don't allow any site to track users' physical location** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Content settings** > **Default geolocation setting** and set it to **Enabled**, then set **Default geolocation setting** to **Don't allow any site to track users' physical location**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
