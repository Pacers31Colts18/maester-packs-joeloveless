# CIS Intune for Microsoft Defender Antivirus Benchmark

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Intune for Microsoft Defender Antivirus Benchmark](https://www.cisecurity.org/benchmark/intune) v1.0.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISDEFINT.L1.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-defender-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISDEFINT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-defender-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-defint-l1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-defender-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISDEFINT.L1.001 | 1.3.1 | Configure local setting override for reporting to Microsoft MAPS is set to Disabled | Medium |
| MP.JL.CISDEFINT.L1.002 | 1.3.2 | Configure the 'Block at First Sight' feature is set to Enabled | Medium |
| MP.JL.CISDEFINT.L1.003 | 1.8.1 | Turn on process scanning whenever real-time protection is enabled is set to Enabled | Medium |
| MP.JL.CISDEFINT.L1.004 | 1.14 | Turn off routine remediation is set to Disabled | Medium |
| MP.JL.CISDEFINT.L1.005 | 2.1 | Allow Archive Scanning is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.006 | 2.2 | Allow Behavior Monitoring is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.007 | 2.3 | Allow Cloud Protection is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.008 | 2.4 | Allow Email Scanning is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.009 | 2.5 | Allow Full Scan Removable Drive Scanning is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.010 | 2.6 | Allow On Access Protection is set to Allow | Medium |
| MP.JL.CISDEFINT.L1.011 | 2.7 | Allow Realtime Monitoring is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.012 | 2.8 | Allow scanning of all downloaded files and attachments is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.013 | 2.9 | Allow Script Scanning is set to Allowed | Medium |
| MP.JL.CISDEFINT.L1.014 | 2.10 | ASR: Block abuse of exploited vulnerable signed drivers is set to Block | High |
| MP.JL.CISDEFINT.L1.015 | 2.11 | ASR: Block Adobe Reader from creating child processes is set to Block | High |
| MP.JL.CISDEFINT.L1.016 | 2.12 | ASR: Block all Office applications from creating child processes is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.017 | 2.13 | ASR: Block credential stealing from the Windows local security authority subsystem is set to Block | High |
| MP.JL.CISDEFINT.L1.018 | 2.14 | ASR: Block executable content from email client and webmail is set to Block | High |
| MP.JL.CISDEFINT.L1.019 | 2.15 | ASR: Block executable files from running unless they meet a prevalence, age, or trusted list criterion is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.020 | 2.16 | ASR: Block execution of potentially obfuscated scripts is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.021 | 2.17 | ASR: Block JavaScript or VBScript from launching downloaded executable content is set to Block | High |
| MP.JL.CISDEFINT.L1.022 | 2.18 | ASR: Block Office applications from creating executable content is set to Block | High |
| MP.JL.CISDEFINT.L1.023 | 2.19 | ASR: Block Office applications from injecting code into other processes is set to Block | High |
| MP.JL.CISDEFINT.L1.024 | 2.20 | ASR: Block Office communication application from creating child processes is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.025 | 2.21 | ASR: Block persistence through WMI event subscription is set to Block | High |
| MP.JL.CISDEFINT.L1.026 | 2.22 | ASR: Block process creations originating from PSExec and WMI commands is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.027 | 2.23 | ASR: Block rebooting machine in Safe Mode is set to Block | High |
| MP.JL.CISDEFINT.L1.028 | 2.24 | ASR: Block untrusted and unsigned processes that run from USB is set to Block | High |
| MP.JL.CISDEFINT.L1.029 | 2.25 | ASR: Block Win32 API calls from Office macros is set to Block | High |
| MP.JL.CISDEFINT.L1.030 | 2.26 | ASR: Use advanced protection against ransomware is set to Audit or Block | High |
| MP.JL.CISDEFINT.L1.031 | 2.27 | Check For Signatures Before Running Scan is set to Enabled | High |
| MP.JL.CISDEFINT.L1.032 | 2.28 | Cloud Block Level is set to High or higher | Medium |
| MP.JL.CISDEFINT.L1.033 | 2.29 | Cloud Extended Timeout is at least 1 | Medium |
| MP.JL.CISDEFINT.L1.034 | 2.30 | Days Until Aggressive Catchup Quick Scan is set to 7 | Medium |
| MP.JL.CISDEFINT.L1.035 | 2.32 | Enable Dynamic Signature Dropped Event Reporting is set to Dynamic Security intelligence update events will be reported | Medium |
| MP.JL.CISDEFINT.L1.036 | 2.33 | Enable File Hash Computation is set to Enable | Medium |
| MP.JL.CISDEFINT.L1.037 | 2.34 | Enable Network Protection is set to Enabled (block mode) | Medium |
| MP.JL.CISDEFINT.L1.038 | 2.35 | Hide Exclusions From Local Users is set to Enabled | Medium |
| MP.JL.CISDEFINT.L1.039 | 2.36 | Oobe Enable Rtp And Sig Update is set to Enabled | Medium |
| MP.JL.CISDEFINT.L1.040 | 2.37 | PUA Protection is set to PUA Protection on | Medium |
| MP.JL.CISDEFINT.L1.041 | 2.38 | Quick Scan Include Exclusions is set to 1 | Medium |
| MP.JL.CISDEFINT.L1.042 | 2.39 | Real Time Scan Direction is set to Monitor all files bi-directional | Medium |
| MP.JL.CISDEFINT.L1.043 | 2.41 | Remote Encryption Protection Configured State is set to Audit or Block | Medium |
| MP.JL.CISDEFINT.L1.044 | 2.42 | Scan Parameter is set to Quick scan or Full scan | Medium |
| MP.JL.CISDEFINT.L1.045 | 2.43 | Schedule Quick Scan Time is at least 1 | Medium |
| MP.JL.CISDEFINT.L1.046 | 2.44 | Schedule Scan Time is at least 1 | Medium |
| MP.JL.CISDEFINT.L1.047 | 2.45 | Schedule Scan Day is not set to No scheduled scan | Medium |
| MP.JL.CISDEFINT.L1.048 | 2.46 | Signature Update Interval is set to 1 to 4 | Medium |
| MP.JL.CISDEFINT.L1.049 | 2.47 | Submit Samples Consent is set to Send safe samples or all samples automatically | Medium |
| MP.JL.CISDEFINT.L1.050 | 2.48 | Remediation action for Moderate severity threats is set to Quarantine or Remove | Medium |
| MP.JL.CISDEFINT.L1.051 | 2.49 | Remediation action for High severity threats is set to Quarantine or Remove | Medium |
| MP.JL.CISDEFINT.L1.052 | 2.50 | Remediation action for Severe threats is set to Quarantine or Remove | Medium |
