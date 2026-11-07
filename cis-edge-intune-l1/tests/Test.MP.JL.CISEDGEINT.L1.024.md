#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.32.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Startup, home page and new tab page > Disable Bing chat entry-points on Microsoft Edge Enterprise new tab page** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Startup, home page and new tab page** > **Disable Bing chat entry-points on Microsoft Edge Enterprise new tab page** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
