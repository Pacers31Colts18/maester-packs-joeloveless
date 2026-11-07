#### Description

CIS Microsoft Intune for Edge Benchmark, recommendation 1.4.6 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Edge > Content settings > Control use of the File System API for writing** to **Enabled**, with **Control use of the File System API for writing** set to **Don't allow any site to request write access to files and directories** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Edge** > **Content settings** > **Control use of the File System API for writing** and set it to **Enabled**, then set **Control use of the File System API for writing** to **Don't allow any site to request write access to files and directories**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
