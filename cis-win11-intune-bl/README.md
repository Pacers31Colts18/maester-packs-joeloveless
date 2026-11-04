# CIS Windows 11 Intune BL

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the BL recommendations of
the [CIS Microsoft Intune for Windows 11 Benchmark](https://www.cissecurity.org/benchmark/intune) v5.0.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISW11INT.BL.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-win11-intune-bl
    Connect-Maester
    Invoke-Maester -Pack JL.CISW11INT.BL

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-win11-intune-bl | Select-Object -ExpandProperty Parameters` lists them):

| Parameter | Default | Effect |
| --- | --- | --- |
| `Source` | per test | `settingsCatalog`, `compliance` or `deviceConfiguration`. |
| `Platform` | per test | settingsCatalog: the platform the policy targets, such as `windows10`. |
| `SettingDefinitionId` | per test | settingsCatalog: the setting checked. (`Property` and `ODataType` for the other sources.) |
| `Expected` | per test | The value the recommendation requires. |
| `PolicyNameFilter` | none | Only policies whose name matches this wildcard count. |
| `IncludeUnassigned` | `false` | Count policies that are not assigned to anything. |
| `AllowConflicts` | `false` | Pass even when a counted policy sets a conflicting value. |

Changing `Source`, `Platform`, `SettingDefinitionId` or `Expected` in the config changes what the test checks; the
result row records that the value came from `Config`. Set a filter for every test at once with `GlobalSettings`, or
tune one test with `TestSettings`, in `maester-config.json`:

```json
{
  "GlobalSettings": { "JLIntune.PolicyNameFilter": "W11-CIS-*" }
}
```

## Moving to a new benchmark version

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-win11-bl.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-win11-intune-bl <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISW11INT.BL.001 | 8.1 | Require Device Encryption is set to Enabled | High |
| MP.JL.CISW11INT.BL.002 | 8.2 | Allow Warning For Other Disk Encryption is set to Disabled | Medium |
| MP.JL.CISW11INT.BL.003 | 8.3 | Allow Warning For Other Disk Encryption: Allow Standard User Encryption is set to Disabled: Enabled | Medium |
| MP.JL.CISW11INT.BL.004 | 4.11.7.5 | Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later): Select the encryption method for operating system drives is set to Enabled: XTS-AES 128-bit or XTS-AES 256-bit | High |
| MP.JL.CISW11INT.BL.005 | 4.11.7.4 | Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later): Select the encryption method for fixed data drives is set to Enabled: XTS-AES 128-bit or XTS-AES 256-bit | High |
| MP.JL.CISW11INT.BL.006 | 4.11.7.6 | Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later): Select the encryption method for removable data drives is set to Enabled: XTS-AES 128-bit or XTS-AES 256-bit | High |
| MP.JL.CISW11INT.BL.007 | 4.10.9.1.1 | Prevent installation of devices using drivers that match these device setup classes is set to Enabled | Medium |
| MP.JL.CISW11INT.BL.008 | 4.10.9.1.2 | Prevent installation of devices using drivers that match these device setup classes: Also apply to matching devices that are already installed. is set to Enabled: TRUE | Medium |
| MP.JL.CISW11INT.BL.009 | 4.10.9.1.3 | Prevent installation of devices using drivers that match these device setup classes: Prevented Classes is set to Enabled: {d48179be-ec20-11d1-b6b8-00c04fa372a7}, {7ebefbc0-3200-11d2-b4c2-00a0C9697d07}, {c06ff265-ae09-48f0-812c-16753d7cba83}, {6bdd1fc1-810f-11d0-bec7-08002be2092f} | Medium |
| MP.JL.CISW11INT.BL.010 | 4.11.7.1.1 | Choose how BitLocker-protected fixed drives can be recovered is set to Enabled | Medium |
| MP.JL.CISW11INT.BL.011 | 4.11.7.1.3 | Choose how BitLocker-protected fixed drives can be recovered: Configure user storage of BitLocker recovery information is set to Enabled: Allow 48-digit recovery password | Medium |
| MP.JL.CISW11INT.BL.012 | 4.11.7.1.6 | Choose how BitLocker-protected fixed drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for fixed data drives is set to Enabled: FALSE | Medium |
| MP.JL.CISW11INT.BL.013 | 4.11.7.1.4 | Choose how BitLocker-protected fixed drives can be recovered: Allow data recovery agent is set to Enabled: TRUE | Medium |
| MP.JL.CISW11INT.BL.014 | 4.11.7.1.2 | Choose how BitLocker-protected fixed drives can be recovered: FDVRecoveryKeyUsageDropDown_Name is set to Enabled: Allow 256-bit recovery key | Medium |
| MP.JL.CISW11INT.BL.015 | 4.11.7.1.5 | Choose how BitLocker-protected fixed drives can be recovered: Configure storage of BitLocker recovery information to AD DS is set to Enabled: Backup recovery passwords only | Medium |
| MP.JL.CISW11INT.BL.016 | 4.11.7.1.7 | Choose how BitLocker-protected fixed drives can be recovered: Omit recovery options from the BitLocker setup wizard is set to Enabled: TRUE | Medium |
| MP.JL.CISW11INT.BL.017 | 4.11.7.1.8 | Choose how BitLocker-protected fixed drives can be recovered: Save BitLocker recovery information to AD DS for fixed data drives is set to Enabled: FALSE | Medium |
| MP.JL.CISW11INT.BL.018 | 4.11.7.2.1 | Choose how BitLocker-protected operating system drives can be recovered is set to Enabled | Medium |
| MP.JL.CISW11INT.BL.019 | 4.11.7.2.2 | Choose how BitLocker-protected operating system drives can be recovered: OSRecoveryKeyUsageDropDown_Name is set to Enabled: Do not allow 256-bit recovery key | Medium |
| MP.JL.CISW11INT.BL.020 | 4.11.7.2.5 | Choose how BitLocker-protected operating system drives can be recovered: Configure storage of BitLocker recovery information to AD DS is set to Enabled: Store recovery passwords and key packages | Medium |
| MP.JL.CISW11INT.BL.021 | 4.11.7.2.7 | Choose how BitLocker-protected operating system drives can be recovered: Omit recovery options from the BitLocker setup wizard is set to Enabled: TRUE | Medium |
| MP.JL.CISW11INT.BL.022 | 4.11.7.2.3 | Choose how BitLocker-protected operating system drives can be recovered: Configure user storage of BitLocker recovery information is set to Enabled: Require 48-digit recovery password | Medium |
| MP.JL.CISW11INT.BL.023 | 4.11.7.2.4 | Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent is set to Enabled: FALSE | Medium |
| MP.JL.CISW11INT.BL.024 | 4.11.7.2.6 | Choose how BitLocker-protected operating system drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for operating system drives is set to Enabled: TRUE | Medium |
| MP.JL.CISW11INT.BL.025 | 4.11.7.2.8 | Choose how BitLocker-protected operating system drives can be recovered: Save BitLocker recovery information to AD DS for operating system drives is set to Enabled: TRUE | High |
| MP.JL.CISW11INT.BL.026 | 4.11.7.2.9 | Enforce drive encryption type on operating system drives: Select the encryption type is set to Enabled: Full encryption or Used Space Only encryption | High |
| MP.JL.CISW11INT.BL.027 | 4.11.7.3.1 | Deny write access to removable drives not protected by BitLocker is set to Enabled | Medium |
| MP.JL.CISW11INT.BL.028 | 4.11.7.3.2 | Deny write access to removable drives not protected by BitLocker: Do not allow write access to devices configured in another organization is set to Enabled: FALSE | Medium |
