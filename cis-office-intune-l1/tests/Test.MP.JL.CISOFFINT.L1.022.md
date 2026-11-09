#### Description

CIS Microsoft Intune for Office Benchmark, recommendation 2.1.1.3.2.1.1 (Level 1).

The test passes when an assigned settings catalog policy for Windows sets **Microsoft Access 2016 > Application Settings > Security > Trust Center > Trusted Locations > Allow Trusted Locations on the network** to **Disabled**, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Microsoft Access 2016** > **Application Settings** > **Security** > **Trust Center** > **Trusted Locations** > **Allow Trusted Locations on the network** and set it to **Disabled**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

<!--- Results --->
%TestResult%
