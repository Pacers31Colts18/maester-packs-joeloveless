#### Description

CIS Microsoft Intune for Windows 11 Benchmark, recommendation 4.10.9.1.3 (BL).

The test passes when an assigned settings catalog policy for Windows sets **Administrative Templates > System > Device Installation > Device Installation Restrictions > Prevent installation of devices using drivers that match these device setup classes** to **Enabled**, with **Prevented Classes** set to **{d48179be-ec20-11d1-b6b8-00c04fa372a7}, {7ebefbc0-3200-11d2-b4c2-00a0C9697d07}, {c06ff265-ae09-48f0-812c-16753d7cba83}, {6bdd1fc1-810f-11d0-bec7-08002be2092f}** in the same policy, and no other assigned policy sets it to something else.

#### Remediation action

1. In the [Microsoft Intune admin center](https://intune.microsoft.com), go to **Devices** > **Configuration** and open
   (or create) a settings catalog policy for Windows 10 and later.
2. Add **Administrative Templates** > **System** > **Device Installation** > **Device Installation Restrictions** > **Prevent installation of devices using drivers that match these device setup classes** and set it to **Enabled**, then set **Prevented Classes** to **{d48179be-ec20-11d1-b6b8-00c04fa372a7}, {7ebefbc0-3200-11d2-b4c2-00a0C9697d07}, {c06ff265-ae09-48f0-812c-16753d7cba83}, {6bdd1fc1-810f-11d0-bec7-08002be2092f}**.
3. Assign the policy to your Windows devices, and remove any other assigned policy that sets it to something else.

#### Related links

- [Microsoft Learn](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-deviceinstallation)

<!--- Results --->
%TestResult%
