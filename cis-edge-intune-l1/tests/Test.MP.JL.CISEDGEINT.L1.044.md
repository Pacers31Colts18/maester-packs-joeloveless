#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.62 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Automatically open downloaded MHT or MHTML files from the web in Internet Explorer mode** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Automatically open downloaded MHT or MHTML files from the web in Internet Explorer mode** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
