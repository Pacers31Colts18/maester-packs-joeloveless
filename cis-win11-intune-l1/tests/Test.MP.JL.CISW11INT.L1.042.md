#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.10.24.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > System > Local Security Authority > Allow Custom SSPs and APs to be loaded into LSASS** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **System** > **Local Security Authority** > **Allow Custom SSPs and APs to be loaded into LSASS** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
