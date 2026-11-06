# CIS Apple MacOS 26 Tahoe Intune Benchmark

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Apple MacOS 26 Tahoe Intune Benchark](https://www.cissecurity.org/benchmark/apple_macos_ios_intune) v1.0.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISMACINT.L1.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-macos-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISMACINT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-macos-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-macos26-l1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-macos-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISMACINT.L1.001 | 2.1.1.1 | Disable Guest Account is set to True | Medium |
| MP.JL.CISMACINT.L1.002 | 2.14.1.1 | Allow Sign In is set to False | Medium |
| MP.JL.CISMACINT.L1.003 | 2.14.1.2 | Enabled is set to False | Medium |
| MP.JL.CISMACINT.L1.004 | 2.14.2.4 | Allow Apple Intelligence Report is set to False | Medium |
| MP.JL.CISMACINT.L1.005 | 2.14.2.6 | Allow Genmoji is set to False | Medium |
| MP.JL.CISMACINT.L1.006 | 2.14.2.3 | Allow Image Playground is set to False | Medium |
| MP.JL.CISMACINT.L1.007 | 2.14.2.2 | Allow Writing Tools is set to False | Medium |
| MP.JL.CISMACINT.L1.008 | 2.14.2.1.1.1 | Allow Smart Replies is set to False | Medium |
| MP.JL.CISMACINT.L1.009 | 2.14.2.1.1.2 | Allow Summary is set to False | Medium |
| MP.JL.CISMACINT.L1.010 | 2.14.2.1.2.1 | Allow Transcription is set to False | Medium |
| MP.JL.CISMACINT.L1.011 | 2.14.2.1.2.2 | Allow Transcription Summary is set to False | Medium |
| MP.JL.CISMACINT.L1.012 | 2.14.2.1.3.1 | Allow Summary is set to False | Medium |
| MP.JL.CISMACINT.L1.013 | 2.14.2.5 | Force On Device Only Dictation is set to True | Medium |
| MP.JL.CISMACINT.L1.014 | 2.9.1.3 | Automatic Device Lock is set to 15 or less, but not 0 | Medium |
| MP.JL.CISMACINT.L1.015 | 2.9.1.13 | Change At Next Auth is set to Enabled | Medium |
| MP.JL.CISMACINT.L1.016 | 2.9.1.7 | Regex is configured | Medium |
| MP.JL.CISMACINT.L1.017 | 2.9.1.10 | Failed Attempts Reset In Minutes is at least 15 | Medium |
| MP.JL.CISMACINT.L1.018 | 2.9.1.2 | Maximum Grace Period is set to 0 | Medium |
| MP.JL.CISMACINT.L1.019 | 2.9.1.8 | Maximum Number of Failed Attempts is set to 5 or less, but not 0 | Medium |
| MP.JL.CISMACINT.L1.020 | 2.9.1.1 | Maximum Passcode Age In Days is set to 365 or less, but not 0 | Medium |
| MP.JL.CISMACINT.L1.021 | 2.9.1.12 | Minimum Passcode Length is at least 15 | Medium |
| MP.JL.CISMACINT.L1.022 | 2.9.1.5 | Passcode Reuse Limit is at least 24 | Medium |
| MP.JL.CISMACINT.L1.023 | 2.9.1.11 | Require Alphanumeric Passcode is set to Enabled | Medium |
| MP.JL.CISMACINT.L1.024 | 2.9.1.6 | Require Passcode on Device is set to True | High |
| MP.JL.CISMACINT.L1.025 | 2.14.3.1 | Enabled is set to False | Medium |
| MP.JL.CISMACINT.L1.026 | 2.10.1.1 | Enforce Latest Software Update Version is set to True | High |
| MP.JL.CISMACINT.L1.027 | 2.10.4 | Allow Standard User OS Updates is set to Allowed | High |
| MP.JL.CISMACINT.L1.028 | 2.10.2.1 | Download is set to AlwaysOn | High |
| MP.JL.CISMACINT.L1.029 | 2.10.2.2 | Install OS Updates is set to Always On | High |
| MP.JL.CISMACINT.L1.030 | 2.10.2.3 | Install Security Update is set to AlwaysOn | High |
| MP.JL.CISMACINT.L1.031 | 2.10.3.1 | Enable is set to True | Medium |
| MP.JL.CISMACINT.L1.032 | 2.10.3.2 | Enable Rollback is set to False | Medium |
| MP.JL.CISMACINT.L1.033 | 2.3.1.6 | Defer is set to Enabled | High |
| MP.JL.CISMACINT.L1.034 | 2.3.1.3 | Defer Force At User Login Max Bypass Attempts is set to 0 | High |
| MP.JL.CISMACINT.L1.035 | 2.3.1.2 | Enable is set to On | High |
| MP.JL.CISMACINT.L1.036 | 2.3.1.5 | Force Enable In Setup Assistant is set to True | High |
| MP.JL.CISMACINT.L1.037 | 2.3.1.4 | Show Recovery Key is set to Disabled | High |
| MP.JL.CISMACINT.L1.038 | 2.3.1.1 | User Enters Missing Info is set to True | High |
| MP.JL.CISMACINT.L1.039 | 2.3.2.1 | Prevent FileVault From Being Disabled is set to True | High |
| MP.JL.CISMACINT.L1.040 | 2.4.1.1 | Show Full Name is set to True | Medium |
| MP.JL.CISMACINT.L1.041 | 2.4.2.1 | Disable Login Items Suppression is set to True | Medium |
| MP.JL.CISMACINT.L1.042 | 2.6.2.2 | Enable Firewall is set to True | High |
| MP.JL.CISMACINT.L1.043 | 2.6.2.1 | Enable Stealth Mode is set to True | High |
| MP.JL.CISMACINT.L1.044 | 2.8.9 | Allow Activity Continuation is set to False | Medium |
| MP.JL.CISMACINT.L1.045 | 2.8.5 | Allow Air Play Incoming Requests is set to False | Medium |
| MP.JL.CISMACINT.L1.046 | 2.8.22 | Allow AirDrop is set to False | Medium |
| MP.JL.CISMACINT.L1.047 | 2.8.27 | Allow Apple Personalized Advertising is set to False | Medium |
| MP.JL.CISMACINT.L1.048 | 2.8.13 | Allow ARD Remote Management Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.049 | 2.8.15 | Allow Auto Unlock is set to False | Medium |
| MP.JL.CISMACINT.L1.050 | 2.8.1 | Allow Bluetooth Sharing Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.051 | 2.8.36 | Allow Cloud Address Book is set to False | Medium |
| MP.JL.CISMACINT.L1.052 | 2.8.10 | Allow Cloud Bookmarks is set to False | Medium |
| MP.JL.CISMACINT.L1.053 | 2.8.12 | Allow Cloud Calendar is set to False | Medium |
| MP.JL.CISMACINT.L1.054 | 2.8.37 | Allow Cloud Desktop And Documents is set to False | Medium |
| MP.JL.CISMACINT.L1.055 | 2.8.8 | Allow Cloud Document Sync is set to False | Medium |
| MP.JL.CISMACINT.L1.056 | 2.8.11 | Allow Cloud Freeform is set to False | Medium |
| MP.JL.CISMACINT.L1.057 | 2.8.39 | Allow Cloud Keychain Sync is set to False | Medium |
| MP.JL.CISMACINT.L1.058 | 2.8.34 | Allow Cloud Mail is set to False | Medium |
| MP.JL.CISMACINT.L1.059 | 2.8.24 | Allow Cloud Notes is set to False | Medium |
| MP.JL.CISMACINT.L1.060 | 2.8.7 | Allow Cloud Photo Library is set to False | Medium |
| MP.JL.CISMACINT.L1.061 | 2.8.31 | Allow Cloud Reminders is set to False | Medium |
| MP.JL.CISMACINT.L1.062 | 2.8.18 | Allow Device Name Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.063 | 2.8.30 | Allow Diagnostic Submission is set to False | Medium |
| MP.JL.CISMACINT.L1.064 | 2.8.4 | Allow Erase Content And Settings is set to False | Medium |
| MP.JL.CISMACINT.L1.065 | 2.8.3 | Allow File Sharing Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.066 | 2.8.21 | Allow Find My Friends is set to False | Medium |
| MP.JL.CISMACINT.L1.067 | 2.8.19 | Allow Internet Sharing Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.068 | 2.8.33 | Allow iPhone Mirroring is set to False | Medium |
| MP.JL.CISMACINT.L1.069 | 2.8.38 | Allow iTunes File Sharing is set to False | Medium |
| MP.JL.CISMACINT.L1.070 | 2.8.26 | Allow Local User Creation is set to False | Medium |
| MP.JL.CISMACINT.L1.071 | 2.8.6 | Allow Media Sharing Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.072 | 2.8.25 | Allow Multiplayer Gaming is set to False | Medium |
| MP.JL.CISMACINT.L1.073 | 2.8.32 | Allow Password Proximity Requests is set to False | Medium |
| MP.JL.CISMACINT.L1.074 | 2.8.2 | Allow Password Sharing is set to False | Medium |
| MP.JL.CISMACINT.L1.075 | 2.8.28 | Allow Printer Sharing Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.076 | 2.8.16 | Allow Startup Disk Modification is set to False | Medium |
| MP.JL.CISMACINT.L1.077 | 2.8.17 | Allow UI Configuration Profile Installation is set to False | Medium |
| MP.JL.CISMACINT.L1.078 | 2.8.35 | Allow Universal Control is set to False | Medium |
| MP.JL.CISMACINT.L1.079 | 2.11.1.1 | Display Sleep Timer is set to 10 or less, but not 0 | Medium |
| MP.JL.CISMACINT.L1.080 | 2.11.1.2 | System Sleep Timer is set to 15 or less, but not 0 | Medium |
| MP.JL.CISMACINT.L1.081 | 2.11.1.3 | Wake on LAN is set to False | Medium |
| MP.JL.CISMACINT.L1.082 | 2.11.1.4 | Wake On Modem Ring is set to False | Medium |
| MP.JL.CISMACINT.L1.083 | 2.11.1.5 | Destroy FV Key On Standby is set to True | High |
| MP.JL.CISMACINT.L1.084 | 2.11.2.1 | Ask For Password is set to True | High |
| MP.JL.CISMACINT.L1.085 | 2.11.3.1 | Allow User Overrides is set to False | Medium |
| MP.JL.CISMACINT.L1.086 | 2.12.1.2 | Allow Identified Developers is set to True | Medium |
| MP.JL.CISMACINT.L1.087 | 2.12.1.1 | Enable XProtect Malware Upload is set to Disabled | Medium |
| MP.JL.CISMACINT.L1.088 | 2.12.2.1 | Disable Override is set to True | Medium |
| MP.JL.CISMACINT.L1.089 | 2.7.1 | Removal Password is configured | High |
| MP.JL.CISMACINT.L1.090 | 2.13.1 | Locked enrollment is set to Yes | High |
