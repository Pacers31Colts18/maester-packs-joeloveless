# CIS Microsoft Intune for Edge Benchmark

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Microsoft Intune for Edge Benchmark](https://www.cisecurity.org/benchmark/intune) v1.0.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISEDGEINT.L1.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-edge-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISEDGEINT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-edge-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-edge-l1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-edge-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISEDGEINT.L1.001 | 1.2.1 | Enable Google Cast is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.002 | 1.3.1 | Allow users to manage installed CA certificates is set to Enabled: Disallow users from managing certificates | Medium |
| MP.JL.CISEDGEINT.L1.003 | 1.4.3 | Control use of insecure content exceptions is set to Enabled: Do not allow any site to load blockable mixed content | Medium |
| MP.JL.CISEDGEINT.L1.004 | 1.4.6 | Control use of the File System API for writing is set to Enabled: Don't allow any site to request write access to files and directories | Medium |
| MP.JL.CISEDGEINT.L1.005 | 1.4.9 | Default automatic downloads setting is set to Enabled: Don't allow any website to perform automatic downloads | Medium |
| MP.JL.CISEDGEINT.L1.006 | 1.4.10 | Default geolocation setting is set to Enabled: Don't allow any site to track users' physical location | Medium |
| MP.JL.CISEDGEINT.L1.007 | 1.6.1 | Enable insecure download warnings is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.008 | 1.7.1 | Configure Edge Website Typo Protection is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.009 | 1.9.1 | Configure users ability to override feature flags is set to Enabled: Prevent users from overriding feature flags | Medium |
| MP.JL.CISEDGEINT.L1.010 | 1.10.1 | Blocks external extensions from being installed is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.011 | 1.11.1 | Enable Gamer Mode is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.012 | 1.13.1 | Allow Basic authentication for HTTP is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.013 | 1.13.2 | Allow cross-origin HTTP Basic Auth prompts is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.014 | 1.14.1 | Guided Switch Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.015 | 1.20.1 | Specifies whether to block requests from public websites to devices on a user's local network is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.016 | 1.21.1 | Enable saving passwords to the password manager is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.017 | 1.24.1 | Enable startup boost is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.018 | 1.31.1 | Configure Microsoft Defender SmartScreen is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.019 | 1.31.2 | Configure Microsoft Defender SmartScreen to block potentially unwanted apps is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.020 | 1.31.3 | Enable Microsoft Defender SmartScreen DNS requests is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.021 | 1.31.4 | Force Microsoft Defender SmartScreen checks on downloads from trusted sources is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.022 | 1.31.5 | Prevent bypassing Microsoft Defender SmartScreen prompts for sites is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.023 | 1.31.6 | Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.024 | 1.32.1 | Disable Bing chat entry-points on Microsoft Edge Enterprise new tab page is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.025 | 1.33 | Ads setting for sites with intrusive ads is set to Enabled: Block ads on sites with intrusive ads | Medium |
| MP.JL.CISEDGEINT.L1.026 | 1.34 | Allow download restrictions is set to Enabled: Block malicious downloads | Medium |
| MP.JL.CISEDGEINT.L1.027 | 1.37 | Allow Google Cast to connect to Cast devices on all IP addresses is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.028 | 1.38 | Allow import of data from other browsers on each Microsoft Edge launch is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.029 | 1.39 | Allow importing of autofill form data is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.030 | 1.40 | Allow importing of browser settings is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.031 | 1.41 | Allow importing of home page settings is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.032 | 1.42 | Allow importing of payment info is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.033 | 1.43 | Allow importing of saved passwords is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.034 | 1.44 | Allow importing of search engine settings is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.035 | 1.45 | Allow managed extensions to use the Enterprise Hardware Platform API is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.036 | 1.49 | Allow personalization of ads, search and news by sending browsing history to Microsoft is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.037 | 1.50 | Allow queries to a Browser Network Time service is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.038 | 1.51 | Allow remote debugging is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.039 | 1.52 | Allow the audio sandbox to run is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.040 | 1.54 | Allow user feedback is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.041 | 1.58 | Allow Web Authentication requests on sites with broken TLS certificates is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.042 | 1.59 | Allow websites to query for available payment methods is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.043 | 1.61 | Automatically import another browser's data and settings at first run is set to Enabled: Disables automatic import, and the import section of the first-run experience is skipped | Medium |
| MP.JL.CISEDGEINT.L1.044 | 1.62 | Automatically open downloaded MHT or MHTML files from the web in Internet Explorer mode is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.045 | 1.64 | Block tracking of users' web-browsing activity is set to Enabled: Balanced or Strict | Medium |
| MP.JL.CISEDGEINT.L1.046 | 1.66 | Clear browsing data when Microsoft Edge closes is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.047 | 1.67 | Clear cached images and files when Microsoft Edge closes is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.048 | 1.68 | Clear history for IE and IE mode every time you exit is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.049 | 1.69 | Configure browser process code integrity guard setting is set to Enabled: Enable code integrity guard enforcement in the browser process | Medium |
| MP.JL.CISEDGEINT.L1.050 | 1.70 | Configure InPrivate mode availability is set to Enabled: InPrivate mode disabled | Medium |
| MP.JL.CISEDGEINT.L1.051 | 1.73 | Configure the list of names that will bypass the HSTS policy check is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.052 | 1.74 | Configure the list of types that are excluded from synchronization is set to Enabled and includes passwords | Medium |
| MP.JL.CISEDGEINT.L1.053 | 1.75 | Configure the Share experience is set to Enabled: Don't allow using the Share experience | Medium |
| MP.JL.CISEDGEINT.L1.054 | 1.76 | Continue running background apps after Microsoft Edge closes is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.055 | 1.77 | Control communication with the Experimentation and Configuration Service is set to Enabled: Disable communication with the Experimentation and Configuration Service | Medium |
| MP.JL.CISEDGEINT.L1.056 | 1.80 | Control where security restrictions on insecure origins apply is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.057 | 1.82 | Delete old browser data on migration is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.058 | 1.83 | Disable saving browser history is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.059 | 1.84 | Disable synchronization of data using Microsoft sync services is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.060 | 1.85 | DNS interception checks enabled is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.061 | 1.86 | Dynamic Code Settings is set to Enabled: Prevent the browser process from creating dynamic code | Medium |
| MP.JL.CISEDGEINT.L1.062 | 1.87 | Edge 3P SERP Telemetry Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.063 | 1.88 | Edge Wallet E-Tree Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.064 | 1.89 | Enable Application Bound Encryption is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.065 | 1.90 | Enable AutoFill for addresses is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.066 | 1.91 | Enable AutoFill for payment instruments is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.067 | 1.92 | Enable browser legacy extension point blocking is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.068 | 1.93 | Enable component updates in Microsoft Edge is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.069 | 1.94 | Enable deleting browser and download history is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.070 | 1.96 | Enable globally scoped HTTP auth cache is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.071 | 1.98 | Enable network prediction is set to Enabled: Don't predict network actions on any network connection | Medium |
| MP.JL.CISEDGEINT.L1.072 | 1.99 | Enable profile creation from the Identity flyout menu or the Settings page is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.073 | 1.100 | Enable resolution of navigation errors using a web service is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.074 | 1.102 | Enable security warnings for command-line flags is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.075 | 1.103 | Enable site isolation for every site is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.076 | 1.104 | Enable the Search bar is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.077 | 1.105 | Enable tab organization suggestions is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.078 | 1.107 | Enable upload files from mobile in Microsoft Edge desktop is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.079 | 1.108 | Enable use of ephemeral profiles is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.080 | 1.109 | Enable warnings for insecure forms is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.081 | 1.111 | Enables DALL-E themes generation is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.082 | 1.114 | Enhance the security state in Microsoft Edge is set to Enabled: Balanced mode or Strict mode | Medium |
| MP.JL.CISEDGEINT.L1.083 | 1.116 | Hide the First-run experience and splash screen is set to Enabled | Medium |
| MP.JL.CISEDGEINT.L1.084 | 1.117 | In-app support Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.085 | 1.119 | Manage exposure of local IP addressess by WebRTC is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.086 | 1.120 | Notify a user that a browser restart is recommended or required for pending updates is set to Enabled: Required - Show a recurring prompt to the user indicating that a restart is required | Medium |
| MP.JL.CISEDGEINT.L1.087 | 1.121 | Set disk cache size, in bytes is set to Enabled: 250609664 | Medium |
| MP.JL.CISEDGEINT.L1.088 | 1.122 | Set the time period for update notifications is set to Enabled: 86400000 | Medium |
| MP.JL.CISEDGEINT.L1.089 | 1.123 | Shopping in Microsoft Edge Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.090 | 1.125 | Show Microsoft Rewards experiences is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.091 | 1.126 | Show the Reload in Internet Explorer mode button in the toolbar is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.092 | 1.127 | Specifies whether SharedArrayBuffers can be used in a non cross-origin-isolated context is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.093 | 1.130 | Standalone Sidebar Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.094 | 1.131 | Suggest similar pages when a webpage can't be found is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.095 | 1.132 | Suppress the unsupported OS warning is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.096 | 1.134 | Wait for Internet Explorer mode tabs to completely unload before ending the browser session is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.097 | 1.135 | Wallet Donation Enabled is set to Disabled | Medium |
| MP.JL.CISEDGEINT.L1.098 | 3.1.1 | Update policy override default is set to Enabled: Always allow updates or Automatic silent updates only | Medium |
| MP.JL.CISEDGEINT.L1.099 | 3.3.1 | Auto-update check period override is set to Enabled: any value except 0 | Medium |
