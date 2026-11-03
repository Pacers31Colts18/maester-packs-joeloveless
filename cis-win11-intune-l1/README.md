# CIS Windows 11 Intune L1

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Microsoft Intune for Windows 11 Benchmark](https://www.cisecurity.org/benchmark/intune) v5.0.0. One test per
setting; tests are numbered in the order they were added (MP.JL.CISW11INT.L1.001), and each test's
description names its CIS recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-win11-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISW11INT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names).

If not useing Connect-Maester, you can use Connect-MgGraph to an Application Registration with the proper permissions:

`DeviceManagementConfiguration.Read.All`
`GroupMember.Read.All`

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-win11-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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
  "GlobalSettings": { "JLIntune.PolicyNameFilter": "W11-CIS-*" },
  "TestSettings": [
    { "Id": "MP.JL.CISW11INT.L1.001", "Parameters": { "AllowConflicts": true } }
  ]
}
```

## Moving to a new benchmark version

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-win11-l1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `./tools/Test-Pack.ps1`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-win11-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISW11INT.L1.001 | 1.1 | Allow Cortana Above Lock is set to Block | High |
| MP.JL.CISW11INT.L1.002 | 1.2 | Allow Toasts is set to Block | High |
| MP.JL.CISW11INT.L1.003 | 4.1.3.1 | Prevent enabling lock screen camera is set to Enabled | High |
| MP.JL.CISW11INT.L1.004 | 4.4.1 | Apply UAC restrictions to local accounts on network logons is set to Enabled | High |
| MP.JL.CISW11INT.L1.005 | 4.4.2 | Configure SMB v1 client driver is set to Enabled: Disable driver (recommended) | High |
| MP.JL.CISW11INT.L1.006 | 4.4.3 | Configure SMB v1 server is set to Disabled | High |
| MP.JL.CISW11INT.L1.007 | 4.4.4 | Enable Structured Exception Handling Overwrite Protection (SEHOP) is set to Enabled | High |
| MP.JL.CISW11INT.L1.008 | 4.4.5 | WDigest Authentication (disabling may require KB2871997) is set to Disabled | High |
| MP.JL.CISW11INT.L1.009 | 4.5.1 | MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended) is set to Disabled | High |
| MP.JL.CISW11INT.L1.010 | 4.5.2 | MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing) is set to Enabled: Highest protection, source routing is completely disabled | High |
| MP.JL.CISW11INT.L1.011 | 4.5.3 | MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing) is set to Enabled: Highest protection, source routing is completely disabled | High |
| MP.JL.CISW11INT.L1.012 | 4.5.5 | MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes is set to Disabled | High |
| MP.JL.CISW11INT.L1.013 | 4.5.7 | MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers is set to Enabled | High |
| MP.JL.CISW11INT.L1.014 | 4.5.9 | MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended) is set to Enabled | High |
| MP.JL.CISW11INT.L1.015 | 4.5.12 | MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning: WarningLevel is set to Enabled: 90% or less | High |
| MP.JL.CISW11INT.L1.016 | 4.6.4.1 | Turn off multicast name resolution is set to Enabled | High |
| MP.JL.CISW11INT.L1.017 | 4.6.9.1 | Prohibit installation and configuration of Network Bridge on your DNS domain network is set to Enabled | High |
| MP.JL.CISW11INT.L1.018 | 4.6.9.2 | Prohibit use of Internet Connection Sharing on your DNS domain network is set to Enabled | High |
| MP.JL.CISW11INT.L1.019 | 4.6.9.3 | Require domain users to elevate when setting a network's location is set to Enabled | High |
| MP.JL.CISW11INT.L1.020 | 4.6.11.1 | Hardened UNC Paths is set to Enabled: \\*\NETLOGON and \\*\SYSVOL with RequireIntegrity=1,RequireMutualAuthentication=1,RequirePrivacy=1 | High |
| MP.JL.CISW11INT.L1.021 | 4.6.18.1 | Minimize the number of simultaneous connections to the Internet or a Windows Domain is set to Enabled: 3 = Prevent Wi-Fi when on Ethernet | High |
| MP.JL.CISW11INT.L1.022 | 4.6.18.2 | Prohibit connection to non-domain networks when connected to domain authenticated network is set to Enabled | High |
| MP.JL.CISW11INT.L1.023 | 4.7.1 | Allow Print Spooler to accept client connections is set to Disabled | High |
| MP.JL.CISW11INT.L1.024 | 4.7.2 | Configure Redirection Guard: Redirection Guard Options is set to Enabled: Redirection Guard Enabled | High |
| MP.JL.CISW11INT.L1.025 | 4.7.3 | Configure RPC connection settings: Protocol to use for outgoing RPC connections is set to Enabled: RPC over TCP | High |
| MP.JL.CISW11INT.L1.026 | 4.7.4 | Configure RPC connection settings: Use authentication for outgoing RPC connections is set to Enabled: Default | High |
| MP.JL.CISW11INT.L1.027 | 4.7.5 | Configure RPC listener settings: Authentication protocol to use for incoming RPC connections is set to Enabled: Negotiate or Kerberos | High |
| MP.JL.CISW11INT.L1.028 | 4.7.6 | Configure RPC listener settings: Protocols to allow for incoming RPC connections is set to Enabled: RPC over TCP | High |
| MP.JL.CISW11INT.L1.029 | 4.7.7 | Configure RPC over TCP port: RPC over TCP port is set to Enabled: 0 | High |
| MP.JL.CISW11INT.L1.030 | 4.7.8 | Limits print driver installation to Administrators is set to Enabled | High |
| MP.JL.CISW11INT.L1.031 | 4.7.9 | Manage processing of Queue-specific files: Manage processing of Queue-Specific files is set to Enabled: Limit Queue-specific files to Color profiles | High |
| MP.JL.CISW11INT.L1.032 | 4.7.10 | Point and Print Restrictions: When installing drivers for a new connection is set to Enabled: Show warning and elevation prompt | High |
| MP.JL.CISW11INT.L1.033 | 4.7.11 | Point and Print Restrictions: When updating drivers for an existing connection is set to Enabled: Show warning and elevation prompt | High |
| MP.JL.CISW11INT.L1.034 | 4.10.4.1 | Include command line in process creation events is set to Enabled | High |
| MP.JL.CISW11INT.L1.035 | 4.10.5.1 | Encryption Oracle Remediation is set to Enabled: Force Updated Clients | High |
| MP.JL.CISW11INT.L1.036 | 4.10.5.2 | Remote host allows delegation of non-exportable credentials is set to Enabled | High |
| MP.JL.CISW11INT.L1.037 | 4.10.9.2 | Prevent automatic download of applications associated with device metadata is set to Enabled | High |
| MP.JL.CISW11INT.L1.038 | 4.10.13.1 | Boot-Start Driver Initialization Policy is set to Enabled: Good, unknown and bad but critical | High |
| MP.JL.CISW11INT.L1.039 | 4.10.19.1 | Continue experiences on this device is set to Disabled | High |
| MP.JL.CISW11INT.L1.040 | 4.10.20.1.2 | Turn off downloading of print drivers over HTTP is set to Enabled | High |
| MP.JL.CISW11INT.L1.041 | 4.10.20.1.5 | Turn off Internet download for Web publishing and online ordering wizards is set to Enabled | High |
| MP.JL.CISW11INT.L1.042 | 4.10.24.1 | Allow Custom SSPs and APs to be loaded into LSASS is set to Disabled | High |
| MP.JL.CISW11INT.L1.043 | 4.10.26.1 | Block user from showing account details on sign-in is set to Enabled | High |
| MP.JL.CISW11INT.L1.044 | 4.10.26.2 | Do not display network selection UI is set to Enabled | High |
| MP.JL.CISW11INT.L1.045 | 4.10.26.3 | Do not enumerate connected users on domain-joined computers is set to Enabled | High |
| MP.JL.CISW11INT.L1.046 | 4.10.26.4 | Enumerate local users on domain-joined computers is set to Disabled | High |
| MP.JL.CISW11INT.L1.047 | 4.10.26.5 | Turn off app notifications on the lock screen is set to Enabled | High |
| MP.JL.CISW11INT.L1.048 | 4.10.26.6 | Turn off picture password sign-in is set to Enabled | High |
| MP.JL.CISW11INT.L1.049 | 4.10.26.7 | Turn on convenience PIN sign-in is set to Disabled | High |
| MP.JL.CISW11INT.L1.050 | 4.10.29.5.1 | Require a password when a computer wakes (on battery) is set to Enabled | High |
| MP.JL.CISW11INT.L1.051 | 4.10.29.5.2 | Require a password when a computer wakes (plugged in) is set to Enabled | High |
| MP.JL.CISW11INT.L1.052 | 4.10.30.1 | Configure Offer Remote Assistance is set to Disabled | High |
| MP.JL.CISW11INT.L1.053 | 4.10.30.2 | Configure Solicited Remote Assistance is set to Disabled | High |
| MP.JL.CISW11INT.L1.054 | 4.10.31.1 | Enable RPC Endpoint Mapper Client Authentication is set to Enabled | High |
| MP.JL.CISW11INT.L1.055 | 4.10.31.2 | Restrict Unauthenticated RPC clients is set to Enabled: Authenticated | High |
| MP.JL.CISW11INT.L1.056 | 4.10.44.1.1 | Enable Windows NTP Client is set to Enabled | High |
| MP.JL.CISW11INT.L1.057 | 4.10.44.1.2 | Enable Windows NTP Server is set to Disabled | High |
| MP.JL.CISW11INT.L1.058 | 4.11.3.1 | Allow Microsoft accounts to be optional is set to Enabled | High |
| MP.JL.CISW11INT.L1.059 | 4.11.5.1 | Do not preserve zone information in file attachments (User) is set to Disabled | High |
| MP.JL.CISW11INT.L1.060 | 4.11.5.2 | Notify antivirus programs when opening attachments (User) is set to Enabled | High |
| MP.JL.CISW11INT.L1.061 | 4.11.6.1 | Disallow Autoplay for non-volume devices is set to Enabled | High |
| MP.JL.CISW11INT.L1.062 | 4.11.6.2 | Set the default behavior for AutoRun is set to Enabled: Do not execute any autorun commands | High |
| MP.JL.CISW11INT.L1.063 | 4.11.6.3 | Turn off Autoplay is set to Enabled: All drives | High |
| MP.JL.CISW11INT.L1.064 | 4.11.8.1 | Do not display the password reveal button is set to Enabled | High |
| MP.JL.CISW11INT.L1.065 | 4.11.8.2 | Enumerate administrator accounts on elevation is set to Disabled | High |
| MP.JL.CISW11INT.L1.066 | 4.11.8.3 | Prevent the use of security questions for local accounts is set to Enabled | High |
| MP.JL.CISW11INT.L1.067 | 4.11.10.1 | Enable App Installer Experimental Features is set to Disabled | High |
| MP.JL.CISW11INT.L1.068 | 4.11.10.2 | Enable App Installer Hash Override is set to Disabled | High |
| MP.JL.CISW11INT.L1.069 | 4.11.10.3 | Enable App Installer ms-appinstaller protocol is set to Disabled | High |
| MP.JL.CISW11INT.L1.070 | 4.11.15.1.1 | Control Event Log behavior when the log file reaches its maximum size is set to Disabled | High |
| MP.JL.CISW11INT.L1.071 | 4.11.15.1.2 | Specify the maximum log file size (KB): Maximum Log Size (KB) is set to Enabled: 32,768 or more | High |
| MP.JL.CISW11INT.L1.072 | 4.11.15.2.1 | Control Event Log behavior when the log file reaches its maximum size is set to Disabled | High |
| MP.JL.CISW11INT.L1.073 | 4.11.15.2.2 | Specify the maximum log file size (KB): Maximum Log Size (KB) is set to Enabled: 196,608 or more | High |
| MP.JL.CISW11INT.L1.074 | 4.11.15.3.1 | Control Event Log behavior when the log file reaches its maximum size is set to Disabled | High |
| MP.JL.CISW11INT.L1.075 | 4.11.15.3.2 | Specify the maximum log file size (KB): Maximum Log Size (KB) is set to Enabled: 32,768 or more | High |
| MP.JL.CISW11INT.L1.076 | 4.11.15.4.1 | Control Event Log behavior when the log file reaches its maximum size is set to Disabled | High |
| MP.JL.CISW11INT.L1.077 | 4.11.15.4.2 | Specify the maximum log file size (KB): Maximum Log Size (KB) is set to Enabled: 32,768 or more | High |
| MP.JL.CISW11INT.L1.078 | 4.11.18.1 | Configure Windows Defender SmartScreen is set to Enabled: Warn and prevent bypass | High |
| MP.JL.CISW11INT.L1.079 | 4.11.18.2 | Turn off Data Execution Prevention for Explorer is set to Disabled | High |
| MP.JL.CISW11INT.L1.080 | 4.11.18.3 | Turn off heap termination on corruption is set to Disabled | High |
| MP.JL.CISW11INT.L1.081 | 4.11.18.4 | Turn off shell protocol protected mode is set to Disabled | High |
| MP.JL.CISW11INT.L1.082 | 4.11.27.1 | Block all consumer Microsoft account user authentication is set to Enabled | High |
| MP.JL.CISW11INT.L1.083 | 4.11.30.1 | Prevent users from sharing files within their profile. (User) is set to Enabled | High |
| MP.JL.CISW11INT.L1.084 | 4.11.35.3.2 | Do not allow passwords to be saved is set to Enabled | High |
| MP.JL.CISW11INT.L1.085 | 4.11.35.4.3.2 | Do not allow drive redirection is set to Enabled | High |
| MP.JL.CISW11INT.L1.086 | 4.11.35.4.9.1 | Always prompt for password upon connection is set to Enabled | High |
| MP.JL.CISW11INT.L1.087 | 4.11.35.4.9.2 | Require secure RPC communication is set to Enabled | High |
| MP.JL.CISW11INT.L1.088 | 4.11.35.4.9.3 | Require use of specific security layer for remote (RDP) connections is set to Enabled: SSL | High |
| MP.JL.CISW11INT.L1.089 | 4.11.35.4.9.4 | Require user authentication for remote connections by using Network Level Authentication is set to Enabled | High |
| MP.JL.CISW11INT.L1.090 | 4.11.35.4.9.5 | Set client connection encryption level is set to Enabled: High Level | High |
| MP.JL.CISW11INT.L1.091 | 4.11.35.4.11.1 | Do not delete temp folders upon exit is set to Disabled | High |
| MP.JL.CISW11INT.L1.092 | 4.11.36.1 | Prevent downloading of enclosures is set to Enabled | High |
| MP.JL.CISW11INT.L1.093 | 4.11.41.1 | Turn off the offer to update to the latest version of Windows is set to Enabled | High |
| MP.JL.CISW11INT.L1.094 | 4.11.49.1 | Configure the transmission of the user's password in the content of MPR notifications sent by winlogon. is set to Disabled | High |
| MP.JL.CISW11INT.L1.095 | 4.11.49.2 | Sign-in and lock last interactive user automatically after a restart is set to Disabled | High |
| MP.JL.CISW11INT.L1.096 | 4.11.54.1.1 | Allow Basic authentication is set to Disabled | High |
| MP.JL.CISW11INT.L1.097 | 4.11.54.1.2 | Allow unencrypted traffic is set to Disabled | High |
| MP.JL.CISW11INT.L1.098 | 4.11.54.1.3 | Disallow Digest authentication is set to Enabled | High |
| MP.JL.CISW11INT.L1.099 | 4.11.54.2.1 | Allow Basic authentication is set to Disabled | High |
| MP.JL.CISW11INT.L1.100 | 4.11.54.2.3 | Allow unencrypted traffic is set to Disabled | High |
| MP.JL.CISW11INT.L1.101 | 4.11.54.2.4 | Disallow WinRM from storing RunAs credentials is set to Enabled | High |
| MP.JL.CISW11INT.L1.102 | 6.1 | Account Logon Audit Credential Validation is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.103 | 6.2 | Account Logon Logoff Audit Account Lockout is set to Failure or Success and Failure | High |
| MP.JL.CISW11INT.L1.104 | 6.3 | Account Logon Logoff Audit Group Membership is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.105 | 6.4 | Account Logon Logoff Audit Logoff is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.106 | 6.5 | Account Logon Logoff Audit Logon is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.107 | 6.6 | Account Management Audit Application Group Management is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.108 | 6.7 | Audit Authentication Policy Change is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.109 | 6.8 | Audit Authorization Policy Change is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.110 | 6.9 | Audit Changes to Audit Policy is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.111 | 6.10 | Audit File Share Access is set to Success+Failure | High |
| MP.JL.CISW11INT.L1.112 | 6.11 | Audit Other Logon Logoff Events is set to Success+Failure | High |
| MP.JL.CISW11INT.L1.113 | 6.12 | Audit Security Group Management is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.114 | 6.13 | Audit Security System Extension is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.115 | 6.14 | Audit Special Logon is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.116 | 6.15 | Audit User Account Management is set to Success+Failure | High |
| MP.JL.CISW11INT.L1.117 | 6.16 | Detailed Tracking Audit PNP Activity is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.118 | 6.17 | Detailed Tracking Audit Process Creation is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.119 | 6.18 | Object Access Audit Detailed File Share is set to Failure or Success and Failure | High |
| MP.JL.CISW11INT.L1.120 | 6.19 | Object Access Audit Other Object Access Events is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.121 | 6.20 | Object Access Audit Removable Storage is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.122 | 6.21 | Policy Change Audit MPSSVC Rule Level Policy Change is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.123 | 6.22 | Policy Change Audit Other Policy Change Events is set to Failure or Success and Failure | High |
| MP.JL.CISW11INT.L1.124 | 6.23 | Privilege Use Audit Sensitive Privilege Use is set to Success | High |
| MP.JL.CISW11INT.L1.125 | 6.24 | System Audit I Psec Driver is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.126 | 6.25 | System Audit Other System Events is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.127 | 6.26 | System Audit Security State Change is set to Success or Success and Failure | High |
| MP.JL.CISW11INT.L1.128 | 6.27 | System Audit System Integrity is set to Success+ Failure | High |
| MP.JL.CISW11INT.L1.129 | 15.2 | Refresh cadence is at most 90 | High |
| MP.JL.CISW11INT.L1.130 | 22.1 | DO Download Mode is not set to HTTP blended with Internet peering | High |
| MP.JL.CISW11INT.L1.131 | 23.1 | Configure System Guard Launch is set to Unmanaged Enables Secure Launch if supported by hardware | High |
| MP.JL.CISW11INT.L1.132 | 23.2 | Credential Guard is set to (Enabled with UEFI lock) Turns on Credential Guard with UEFI lock. | High |
| MP.JL.CISW11INT.L1.133 | 23.3 | Enable Virtualization Based Security is set to enable virtualization based security. | High |
| MP.JL.CISW11INT.L1.134 | 23.4 | Require Platform Security Features is set to Turns on VBS with Secure Boot, with or without DMA | High |
| MP.JL.CISW11INT.L1.135 | 33.1 | Allow Cortana is set to Block | High |
| MP.JL.CISW11INT.L1.136 | 33.2 | Allow Spotlight Collection (User) is set to 0 | High |
| MP.JL.CISW11INT.L1.137 | 33.4 | Disable Consumer Account State Content is set to Enabled. | High |
| MP.JL.CISW11INT.L1.138 | 33.5 | Do Not Show Feedback Notifications is set to Feedback notifications are disabled. | High |
| MP.JL.CISW11INT.L1.139 | 37.1 | Enable Domain Network Firewall is set to True | High |
| MP.JL.CISW11INT.L1.140 | 37.2 | Enable Domain Network Firewall: Default Inbound Action for Domain Profile is set to True: Block | High |
| MP.JL.CISW11INT.L1.141 | 37.3 | Enable Domain Network Firewall: Disable Inbound Notifications is set to True: True | High |
| MP.JL.CISW11INT.L1.142 | 37.4 | Enable Domain Network Firewall: Enable Log Dropped Packets is set to True: Enable Logging Of Dropped Packets | High |
| MP.JL.CISW11INT.L1.143 | 37.5 | Enable Domain Network Firewall: Enable Log Success Connections is set to True: Enable Logging Of Successful Connections | High |
| MP.JL.CISW11INT.L1.144 | 37.6 | Enable Domain Network Firewall: Log File Path is set to True: %SystemRoot%\System32\logfiles\firewall\domainfw.log | High |
| MP.JL.CISW11INT.L1.145 | 37.7 | Enable Domain Network Firewall: Log Max File Size is set to True: 16,384 KB or more | High |
| MP.JL.CISW11INT.L1.146 | 37.8 | Enable Private Network Firewall is set to True | High |
| MP.JL.CISW11INT.L1.147 | 37.9 | Enable Private Network Firewall: Default Inbound Action for Private Profile is set to True: Block | High |
| MP.JL.CISW11INT.L1.148 | 37.10 | Enable Private Network Firewall: Disable Inbound Notifications is set to True: True | High |
| MP.JL.CISW11INT.L1.149 | 37.11 | Enable Private Network Firewall: Enable Log Success Connections is set to True: Enable Logging Of Successful Connections | High |
| MP.JL.CISW11INT.L1.150 | 37.12 | Enable Private Network Firewall: Enable Log Dropped Packets is set to True: Enable Logging Of Dropped Packets | High |
| MP.JL.CISW11INT.L1.151 | 37.13 | Enable Private Network Firewall: Log File Path is set to True: %SystemRoot%\System32\logfiles\firewall\privatefw.log | High |
| MP.JL.CISW11INT.L1.152 | 37.14 | Enable Private Network Firewall: Log Max File Size is set to True: 16,384 KB or more | High |
| MP.JL.CISW11INT.L1.153 | 37.15 | Enable Public Network Firewall is set to True | High |
| MP.JL.CISW11INT.L1.154 | 37.16 | Enable Public Network Firewall: Allow Local Ipsec Policy Merge is set to True: False | High |
| MP.JL.CISW11INT.L1.155 | 37.17 | Enable Public Network Firewall: Allow Local Policy Merge is set to True: False | High |
| MP.JL.CISW11INT.L1.156 | 37.18 | Enable Public Network Firewall: Default Inbound Action for Public Profile is set to True: Block | High |
| MP.JL.CISW11INT.L1.157 | 37.19 | Enable Public Network Firewall: Disable Inbound Notifications is set to True: True | High |
| MP.JL.CISW11INT.L1.158 | 37.20 | Enable Public Network Firewall: Enable Log Dropped Packets is set to True: Enable Logging Of Dropped Packets | High |
| MP.JL.CISW11INT.L1.159 | 37.21 | Enable Public Network Firewall: Enable Log Success Connections is set to True: Enable Logging Of Successful Connections | High |
| MP.JL.CISW11INT.L1.160 | 37.22 | Enable Public Network Firewall: Log File Path is set to True: %SystemRoot%\System32\logfiles\firewall\publicfw.log | High |
| MP.JL.CISW11INT.L1.161 | 37.23 | Enable Public Network Firewall: Log Max File Size is set to True: 16,384 KB or more | High |
| MP.JL.CISW11INT.L1.162 | 45.1 | Audit Client Does Not Support Encryption is set to Enabled | High |
| MP.JL.CISW11INT.L1.163 | 45.2 | Audit Client Does Not Support Signing is set to Enabled | High |
| MP.JL.CISW11INT.L1.164 | 45.3 | Audit Insecure Guest Logon is set to Enabled | High |
| MP.JL.CISW11INT.L1.165 | 45.4 | Auth Rate Limiter Delay In Ms is at least 2000 | High |
| MP.JL.CISW11INT.L1.166 | 45.5 | Enable Auth Rate Limiter is set to Enabled | High |
| MP.JL.CISW11INT.L1.167 | 45.6 | Enable Mailslots is set to Disabled | High |
| MP.JL.CISW11INT.L1.168 | 45.7 | Min Smb2 Dialect is set to SMB 3.1.1 | High |
| MP.JL.CISW11INT.L1.169 | 46.1 | Audit Insecure Guest Logon is set to Enabled | High |
| MP.JL.CISW11INT.L1.170 | 46.2 | Audit Server Does Not Support Encryption is set to Enabled | High |
| MP.JL.CISW11INT.L1.171 | 46.3 | Audit Server Does Not Support Signing is set to Enabled | High |
| MP.JL.CISW11INT.L1.172 | 46.4 | Enable Insecure Guest Logons is set to Disabled | High |
| MP.JL.CISW11INT.L1.173 | 46.5 | Enable Mailslots is set to Disabled | High |
| MP.JL.CISW11INT.L1.174 | 46.6 | Min Smb2 Dialect is set to SMB 3.1.1 | High |
| MP.JL.CISW11INT.L1.175 | 46.7 | Require Encryption is set to Enabled | High |
| MP.JL.CISW11INT.L1.176 | 49.1 | Accounts Enable Guest Account Status is set to Disable | High |
| MP.JL.CISW11INT.L1.177 | 49.2 | Accounts Limit Local Account Use Of Blank Passwords To Console Logon Only is set to Enabled | High |
| MP.JL.CISW11INT.L1.178 | 49.3 | Accounts Rename Administrator Account is not Administrator | High |
| MP.JL.CISW11INT.L1.179 | 49.4 | Accounts Rename Guest Account is not Guest | High |
| MP.JL.CISW11INT.L1.180 | 49.6 | Interactive Logon Do Not Display Last Signed In is set to Enabled (username will not be shown) | High |
| MP.JL.CISW11INT.L1.181 | 49.8 | Interactive Logon Machine Inactivity Limit is set to 1 to 900 seconds | High |
| MP.JL.CISW11INT.L1.182 | 49.9 | Interactive Logon Message Title For Users Attempting To Log On is configured | High |
| MP.JL.CISW11INT.L1.183 | 49.10 | Interactive Logon Message Text For Users Attempting To Log On is configured | High |
| MP.JL.CISW11INT.L1.184 | 49.11 | Interactive Logon Smart Card Removal Behavior is set to Lock Workstation, Force Logoff or Disconnect Remote Desktop Session | High |
| MP.JL.CISW11INT.L1.185 | 49.12 | Microsoft Network Client Digitally Sign Communications Always is set to Enable | High |
| MP.JL.CISW11INT.L1.186 | 49.13 | Microsoft Network Client Send Unencrypted Password To Third Party SMB Servers is set to Disable | High |
| MP.JL.CISW11INT.L1.187 | 49.14 | Microsoft Network Server Digitally Sign Communications Always is set to Enable | High |
| MP.JL.CISW11INT.L1.188 | 49.15 | Network Access Do Not Allow Anonymous Enumeration Of SAM Accounts is set to Enabled | High |
| MP.JL.CISW11INT.L1.189 | 49.16 | Network Access Do Not Allow Anonymous Enumeration Of Sam Accounts And Shares is set to Enabled | High |
| MP.JL.CISW11INT.L1.190 | 49.17 | Network Access Restrict Anonymous Access To Named Pipes And Shares is set to Enable | High |
| MP.JL.CISW11INT.L1.191 | 49.18 | Network Access Restrict Clients Allowed To Make Remote Calls To SAM is set to O:BAG:BAD:(A;;RC;;;BA) | High |
| MP.JL.CISW11INT.L1.192 | 49.19 | Network Security Allow Local System To Use Computer Identity For NTLM is set to Allow | High |
| MP.JL.CISW11INT.L1.193 | 49.20 | Network Security Allow PKU2U Authentication Requests is set to Block | High |
| MP.JL.CISW11INT.L1.194 | 49.21 | Network Security LAN Manager Authentication Level is set to Send LM and NTLMv2 responses only. Refuse LM and NTLM | High |
| MP.JL.CISW11INT.L1.195 | 49.22 | Network Security Minimum Session Security For NTLMSSP Based Clients is set to Require NTLM and 128-bit encryption | High |
| MP.JL.CISW11INT.L1.196 | 49.23 | Network Security Minimum Session Security For NTLMSSP Based Servers is set to Require NTLM and 128-bit encryption | High |
| MP.JL.CISW11INT.L1.197 | 49.24 | Network Security Restrict NTLM Audit Incoming NTLM Traffic is set to Enable auditing for all accounts | High |
| MP.JL.CISW11INT.L1.198 | 49.25 | User Account Control Behavior Of The Elevation Prompt For Administrators is set to Prompt for consent or credentials on the secure desktop | High |
| MP.JL.CISW11INT.L1.199 | 49.26 | User Account Control Behavior Of The Elevation Prompt For Standard Users is set to Automatically deny elevation requests | High |
| MP.JL.CISW11INT.L1.200 | 49.27 | User Account Control Detect Application Installations And Prompt For Elevation is set to Enable | High |
| MP.JL.CISW11INT.L1.201 | 49.28 | User Account Control Only Elevate UI Access Applications That Are Installed In Secure Locations is set to Enabled: Application runs with UIAccess integrity only if it resides in secure location. | High |
| MP.JL.CISW11INT.L1.202 | 49.29 | User Account Control Use Admin Approval Mode is set to Enable | High |
| MP.JL.CISW11INT.L1.203 | 49.30 | User Account Control Switch To The Secure Desktop When Prompting For Elevation is set to Enabled | High |
| MP.JL.CISW11INT.L1.204 | 49.31 | User Account Control Run All Administrators In Admin Approval Mode is set to Enabled | High |
| MP.JL.CISW11INT.L1.205 | 49.32 | User Account Control Virtualize File And Registry Write Failures To Per User Locations is set to Enabled | High |
| MP.JL.CISW11INT.L1.206 | 50.1 | Configure Lsa Protected Process is set to Enabled with UEFI lock. LSA will run as protected process and this configuration is UEFI locked. | High |
| MP.JL.CISW11INT.L1.207 | 55.1 | Allow apps from the Microsoft app store to auto update is set to Allowed. | High |
| MP.JL.CISW11INT.L1.208 | 55.2 | Allow Game DVR is set to Block | High |
| MP.JL.CISW11INT.L1.209 | 55.4 | Block Non Admin User Install is set to Allow | High |
| MP.JL.CISW11INT.L1.210 | 55.6 | MSI Allow User Control Over Install is set to Disabled | High |
| MP.JL.CISW11INT.L1.211 | 55.7 | MSI Always Install With Elevated Privileges is set to Disabled | High |
| MP.JL.CISW11INT.L1.212 | 69.2 | Allow Input Personalization is set to Block | High |
| MP.JL.CISW11INT.L1.213 | 69.4 | Let Apps Activate With Voice Above Lock is set to Force deny. Windows apps cannot be activated by voice while the screen is locked, and users cannot change it. | High |
| MP.JL.CISW11INT.L1.214 | 73.2 | Allow Indexing Encrypted Stores Or Items is set to Block | High |
| MP.JL.CISW11INT.L1.215 | 73.3 | Allow Search To Use Location is set to Block | High |
| MP.JL.CISW11INT.L1.216 | 77.1.1 | Notify Malicious is set to Enabled | High |
| MP.JL.CISW11INT.L1.217 | 77.1.2 | Notify Password Reuse is set to Enabled | High |
| MP.JL.CISW11INT.L1.218 | 77.1.3 | Notify Unsafe App is set to Enabled | High |
| MP.JL.CISW11INT.L1.219 | 77.1.4 | Service Enabled is set to Enabled | High |
| MP.JL.CISW11INT.L1.220 | 80.1 | Enable Sudo is set to Sudo is disabled. | High |
| MP.JL.CISW11INT.L1.221 | 81.3 | Allow Telemetry is set to Basic | High |
| MP.JL.CISW11INT.L1.222 | 81.6 | Enable One Settings Auditing is set to Enabled. | High |
| MP.JL.CISW11INT.L1.223 | 90.1 | Access Credential Manager As Trusted Caller is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.224 | 90.2 | Access From Network is set to *S-1-5-32-544, *S-1-5-32-555 | High |
| MP.JL.CISW11INT.L1.225 | 90.3 | Act As Part Of The Operating System is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.226 | 90.4 | Allow Local Log On is set to *S-1-5-32-544, *S-1-5-32-545 | High |
| MP.JL.CISW11INT.L1.227 | 90.5 | Backup Files And Directories is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.228 | 90.6 | Change System Time is set to *S-1-5-32-544, *S-1-5-19 | High |
| MP.JL.CISW11INT.L1.229 | 90.7 | Create Global Objects is set to *S-1-5-32-544, *S-1-5-19, *S-1-5-20, *S-1-5-6 | High |
| MP.JL.CISW11INT.L1.230 | 90.8 | Create Page File is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.231 | 90.9 | Create Permanent Shared Objects is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.232 | 90.10 | Create Symbolic Links is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.233 | 90.11 | Create Token is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.234 | 90.12 | Debug Programs is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.235 | 90.13 | Deny Access From Network includes Guests, Local account | High |
| MP.JL.CISW11INT.L1.236 | 90.14 | Deny Local Log On includes Guests | High |
| MP.JL.CISW11INT.L1.237 | 90.15 | Deny Log On As Batch Job includes Guests | High |
| MP.JL.CISW11INT.L1.238 | 90.16 | Deny Log On As Service includes Guests | High |
| MP.JL.CISW11INT.L1.239 | 90.17 | Deny Remote Desktop Services Log On includes Guests, Local account | High |
| MP.JL.CISW11INT.L1.240 | 90.18 | Enable Delegation is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.241 | 90.19 | Generate Security Audits is set to *S-1-5-19, *S-1-5-20, *S-1-5-99 | High |
| MP.JL.CISW11INT.L1.242 | 90.20 | Impersonate Client is set to *S-1-5-32-544, *S-1-5-19, *S-1-5-20, *S-1-5-6, *S-1-5-99 | High |
| MP.JL.CISW11INT.L1.243 | 90.21 | Increase Scheduling Priority is set to *S-1-5-32-544, *S-1-5-90-0 | High |
| MP.JL.CISW11INT.L1.244 | 90.22 | Load Unload Device Drivers is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.245 | 90.23 | Lock Memory is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.246 | 90.25 | Manage Auditing And Security Log is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.247 | 90.26 | Manage Volume is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.248 | 90.27 | Modify Firmware Environment is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.249 | 90.28 | Modify Object Label is set to (<![CDATA[]]>) | High |
| MP.JL.CISW11INT.L1.250 | 90.29 | Profile Single Process is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.251 | 90.30 | Profile System Performance is set to *S-1-5-32-544, *S-1-5-80 | High |
| MP.JL.CISW11INT.L1.252 | 90.31 | Remote Shutdown is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.253 | 90.32 | Replace Process Level Token is set to *S-1-5-19, *S-1-5-20 | High |
| MP.JL.CISW11INT.L1.254 | 90.33 | Restore Files And Directories is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.255 | 90.34 | Shut Down The System is set to *S-1-5-32-544, *S-1-5-32-545 | High |
| MP.JL.CISW11INT.L1.256 | 90.35 | Take Ownership is set to *S-1-5-32-544 | High |
| MP.JL.CISW11INT.L1.257 | 91.1 | Hypervisor Enforced Code Integrity is set to (Enabled with UEFI lock) Turns on Hypervisor-Protected Code Integrity with UEFI lock. | High |
| MP.JL.CISW11INT.L1.258 | 91.2 | Require UEFI Memory Attributes Table is set to Require UEFI Memory Attributes Table | High |
| MP.JL.CISW11INT.L1.259 | 94.1 | Allow Auto Connect To Wi Fi Sense Hotspots is set to Block | High |
| MP.JL.CISW11INT.L1.260 | 98.1 | Enable ESS with Supported Peripherals is set to Enhanced sign-in security will be enabled on systems with capable software and hardware, following the existing default behavior in Windows. For systems with one secure modality (face or fingerprint) and one insecure modality (fingerprint or face), only the secure sensor can be used for sign-in and the insecure sensor(s) will be blocked. This includes peripheral devices, which are unsupported and will be unusable. (default and recommended for highest security) | High |
| MP.JL.CISW11INT.L1.261 | 98.2 | Facial Features Use Enhanced Anti Spoofing is set to true | High |
| MP.JL.CISW11INT.L1.262 | 98.3 | Minimum PIN Length is set to 6 | High |
| MP.JL.CISW11INT.L1.263 | 98.4 | Require Security Device is set to true | High |
| MP.JL.CISW11INT.L1.264 | 99.2 | Allow Windows Ink Workspace is set to Disabled, or enabled but not above the lock screen | High |
| MP.JL.CISW11INT.L1.265 | 102.1 | Allow Clipboard Redirection is set to Not allowed. | High |
| MP.JL.CISW11INT.L1.266 | 102.2 | Allow Networking is set to Not allowed. | High |
| MP.JL.CISW11INT.L1.267 | 104.1 | Allow Auto Update is not set to Turn off automatic updates | High |
| MP.JL.CISW11INT.L1.268 | 104.2 | Defer Feature Updates Period In Days is at least 180 | High |
| MP.JL.CISW11INT.L1.269 | 104.3 | Manage Preview Builds is set to Disable Preview builds | High |
| MP.JL.CISW11INT.L1.270 | 104.4 | Scheduled Install Day is set to Every day | High |
| MP.JL.CISW11INT.L1.271 | 104.5 | Block "Pause Updates" ability is set to Block | High |
| MP.JL.CISW11INT.L1.272 | 105.1 | Require Pin For Pairing is set to Pairing ceremony for new devices will always require a PIN | High |
| MP.JL.CISW11INT.L1.273 | 107.1 | Backup Directory is set to Backup the password to Microsoft Entra ID only | High |
| MP.JL.CISW11INT.L1.274 | 107.2 | Password Age Days is at most 30 | High |
| MP.JL.CISW11INT.L1.275 | 107.3 | Password Complexity is set to Large letters + small letters + numbers + special characters or stronger | High |
| MP.JL.CISW11INT.L1.276 | 107.4 | Password Length is at least 15 | High |
| MP.JL.CISW11INT.L1.277 | 107.5 | Post Authentication Actions is set to Reset the password and logoff, or reset and reboot | High |
| MP.JL.CISW11INT.L1.278 | 107.6 | Post Authentication Reset Delay is set to 1 to 8 hours | High |
| MP.JL.CISW11INT.L1.279 | 82.3 | Computer Browser (Browser) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.280 | 82.7 | IIS Admin Service (IISADMIN) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.281 | 82.8 | Infrared monitor service (irmon) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.282 | 82.10 | LxssManager (LxssManager) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.283 | 82.11 | Microsoft FTP Service (FTPSVC) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.284 | 82.13 | OpenSSH SSH Server (sshd) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.285 | 82.20 | Remote Procedure Call (RPC) Locator (RpcLocator) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.286 | 82.22 | Routing and Remote Access (RemoteAccess) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.287 | 82.24 | Simple TCP/IP Services (simptcp) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.288 | 82.26 | Special Administration Console Helper (sacsvr) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.289 | 82.27 | SSDP Discovery (SSDPSRV) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.290 | 82.28 | UPnP Device Host (upnphost) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.291 | 82.29 | Web Management Service (WMSvc) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.292 | 82.32 | Windows Media Player Network Sharing Service (WMPNetworkSvc) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.293 | 82.33 | Windows Mobile Hotspot Service (icssvc) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.294 | 82.36 | World Wide Web Publishing Service (W3SVC) is set to Disabled or Not Installed | Medium |
| MP.JL.CISW11INT.L1.295 | 82.37 | Xbox Accessory Management Service (XboxGipSvc) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.296 | 82.38 | Xbox Live Auth Manager (XblAuthManager) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.297 | 82.39 | Xbox Live Game Save (XblGameSave) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.298 | 82.40 | Xbox Live Networking Service (XboxNetApiSvc) is set to Disabled | Medium |
| MP.JL.CISW11INT.L1.299 | 4.1.3.2 | Prevent enabling lock screen slide show is set to Enabled | High |
| MP.JL.CISW11INT.L1.300 | 15.1 | Config refresh is set to Enabled. | High |
| MP.JL.CISW11INT.L1.301 | 106.1.1 | Require BitLocker is set to Require | High |
| MP.JL.CISW11INT.L1.302 | 106.1.2 | Require Secure Boot to be enabled on the device is set to Require | High |
| MP.JL.CISW11INT.L1.303 | 106.1.3 | Require code integrity is set to Require | High |
| MP.JL.CISW11INT.L1.304 | 106.2.1.1 | Firewall is set to Require | High |
| MP.JL.CISW11INT.L1.305 | 106.2.1.2 | Trusted Platform Module (TPM) is set to Require | High |
| MP.JL.CISW11INT.L1.306 | 106.2.1.3 | Antivirus is set to Require | High |
| MP.JL.CISW11INT.L1.307 | 106.2.1.4 | Antispyware is set to Require | High |
