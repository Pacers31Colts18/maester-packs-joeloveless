# CIS Apple iOS 26 and iPadOS26 Intune Benchmark

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Apple iOS 26 and iPadOS 26 Intune Benchmark](https://www.cissecurity.org/benchmark/apple_macos_ios_intune) v1.0.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISIOSINT.L1.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-ios-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISIOSINT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-ios-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-ios26-supl1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-ios-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISIOSINT.L1.001 | 3.1.1 | Block viewing corporate documents in unmanaged apps is set to Yes | High |
| MP.JL.CISIOSINT.L1.002 | 3.1.2 | Treat AirDrop as an unmanaged destination is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.003 | 3.1.3 | Allow copy/paste to be affected by managed open-in is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.004 | 3.1.4 | Block App Store is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.005 | 3.1.5 | Block access to network drive in Files app is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.006 | 3.2.1 | Block Siri while device is locked is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.007 | 3.2.2 | Require Safari fraud warnings is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.008 | 3.3.1 | Force encrypted backup is set to Yes | High |
| MP.JL.CISIOSINT.L1.009 | 3.3.2 | Block managed apps from storing data in iCloud is set to Yes | High |
| MP.JL.CISIOSINT.L1.010 | 3.3.3 | Block backup of enterprise books is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.011 | 3.3.4 | Block notes and highlights sync for enterprise books is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.012 | 3.3.5 | Block iCloud Photos sync is set to Yes | High |
| MP.JL.CISIOSINT.L1.013 | 3.3.6 | Block iCloud Photo Library is set to Yes | High |
| MP.JL.CISIOSINT.L1.014 | 3.3.7 | Block My Photo Stream is set to Yes | High |
| MP.JL.CISIOSINT.L1.015 | 3.3.8 | Block Handoff is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.016 | 3.3.9 | Block iCloud backup is set to Yes | High |
| MP.JL.CISIOSINT.L1.017 | 3.3.10 | Block iCloud document and data sync is set to Yes | High |
| MP.JL.CISIOSINT.L1.018 | 3.3.11 | Block iCloud Keychain sync is set to Yes | High |
| MP.JL.CISIOSINT.L1.019 | 3.4.1 | Force Apple Watch wrist detection is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.020 | 3.4.2 | Require AirPlay outgoing requests pairing password is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.021 | 3.4.3 | Block Apple Watch auto unlock is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.022 | 3.4.4 | Block iBeacon discovery of AirPrint printers is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.023 | 3.4.5 | Block access to USB drive in Files app is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.024 | 3.5.1 | Block sending diagnostic and usage data to Apple is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.025 | 3.5.2 | Block screenshots and screen recording is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.026 | 3.5.4 | Force limited ad tracking is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.027 | 3.5.5 | Block trusting new enterprise app authors is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.028 | 3.5.6 | Limit Apple personalized advertising is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.029 | 3.5.7 | Block users from erasing all content and settings on device is set to Yes | High |
| MP.JL.CISIOSINT.L1.030 | 3.5.8 | Block modification of device name is set to Yes | High |
| MP.JL.CISIOSINT.L1.031 | 3.5.9 | Block configuration profile changes is set to Yes | High |
| MP.JL.CISIOSINT.L1.032 | 3.5.10 | Allow activation lock is set to Yes | High |
| MP.JL.CISIOSINT.L1.033 | 3.5.11 | Force automatic date and time is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.034 | 3.5.12 | Block VPN creation is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.035 | 3.6.1 | Block Control Center access in lock screen is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.036 | 3.6.3 | Block Today view in lock screen is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.037 | 3.6.4 | Block Wallet notifications in lock screen is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.038 | 3.7.1 | Require password is set to Yes | High |
| MP.JL.CISIOSINT.L1.039 | 3.7.2 | Block simple passwords is set to Yes | High |
| MP.JL.CISIOSINT.L1.040 | 3.7.4 | Minimum password length is at least 6 | High |
| MP.JL.CISIOSINT.L1.041 | 3.7.5 | Maximum minutes after screen lock before password is required is set to Immediately | High |
| MP.JL.CISIOSINT.L1.042 | 3.7.6 | Maximum minutes of inactivity until screen locks is at most 2 | High |
| MP.JL.CISIOSINT.L1.043 | 3.7.8 | Block password proximity requests is set to Yes | High |
| MP.JL.CISIOSINT.L1.044 | 3.7.9 | Block password sharing is set to Yes | High |
| MP.JL.CISIOSINT.L1.045 | 3.7.10 | Require Touch ID or Face ID authentication for AutoFill of password or credit card information is set to Yes | High |
| MP.JL.CISIOSINT.L1.046 | 3.8.1 | Block voice dialing while device is locked is set to Yes | Medium |
| MP.JL.CISIOSINT.L1.047 | 3.9.1 | Lock Screen Message is configured | High |
| MP.JL.CISIOSINT.L1.048 | 3.10.1 | Locked enrollment is set to Yes | High |
| MP.JL.CISIOSINT.L1.049 | 3.10.2 | Sync with computers is set to Deny All | High |
| MP.JL.CISIOSINT.L1.050 | 4.1 | Jailbroken devices is set to Block | High |
| MP.JL.CISIOSINT.L1.051 | 4.2 | Minimum OS version is configured | High |
| MP.JL.CISIOSINT.L1.052 | 4.3 | Mark device noncompliant is set to Immediately | High |
| MP.JL.CISIOSINT.L1.053 | 4.5 | Device compliance status is set to Compliant | High |
| MP.JL.CISIOSINT.L1.054 | 4.6 | Mark devices with no compliance policy assigned as is set to Not compliant | High |
| MP.JL.CISIOSINT.L1.055 | 4.7 | Compliance status validity period (days) is at most 7 | High |
