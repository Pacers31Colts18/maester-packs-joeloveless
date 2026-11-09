# CIS Microsoft Intune for Office Benchmark

A [Maester Pack](https://maester.dev/docs/packs) that checks your Intune policies against the Level 1 recommendations of
the [CIS Microsoft Intune for Office Benchmark](https://www.cisecurity.org/benchmark/intune) v1.1.0. One test per setting; tests are numbered in the order they were added (MP.JL.CISOFFINT.L1.001), and each test's description names
its recommendation.

The tests read policy configuration (a policy exists, is assigned and has the value), not whether devices applied it.

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/cis-office-intune-l1
    Connect-Maester
    Invoke-Maester -Pack JL.CISOFFINT.L1

Maester's default Graph scopes include what the pack reads (`DeviceManagementConfiguration.Read.All`, and
`GroupMember.Read.All` to show group names). An account with the Global Reader role is enough.

## How a setting test decides

A test passes when at least one **assigned** policy sets the setting as the recommendation requires and no other
assigned policy sets it to something else. What a test checks is in its parameters, with the recommendation's values
as defaults (`Get-MtTest -Path ./cis-office-intune-l1 | Select-Object -ExpandProperty Parameters` lists them):

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

The benchmark's name and version are set in one place: `tests/frameworks/cis-intune-office-l1.json` (`Name`,
`Version`). Maester writes that version on every result row.

1. Change `Version` in the framework file.
2. Run `Test-JLMaesterPack`. It fails and lists each text that still names the old version (the manifest
   `Description`, the guide `Summary`, this README and the repository README). Update them.
3. Update the tests whose recommendations changed, and the `Requirements` in the framework file: add new
   recommendation IDs, remove withdrawn ones.
4. Bump `Version` in `maester-pack.json` and add a `## cis-office-intune-l1 <version>` entry to `CHANGELOG.md`.

The pack's Code and test IDs stay the same, so `Update-MtPack` moves everyone to the new release.

## Tests

| ID | Recommendation # | Title | Severity |
| --- | --- | --- | --- |
| MP.JL.CISOFFINT.L1.001 | 1.1.1.1 | Block Flash activation in Office documents is set to Enabled: Block all activation | Medium |
| MP.JL.CISOFFINT.L1.002 | 1.1.1.2 | Restrict legacy JScript execution for Office is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.003 | 1.2.5.1.1 | Add-on Management is set to Enabled | High |
| MP.JL.CISOFFINT.L1.004 | 1.2.5.1.2 | Bind to object is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.005 | 1.2.5.1.3 | Consistent Mime Handling is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.006 | 1.2.5.1.4 | Disable user name and password is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.007 | 1.2.5.1.5 | Information Bar is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.008 | 1.2.5.1.6 | Local Machine Zone Lockdown Security is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.009 | 1.2.5.1.7 | Mime Sniffing Safety Feature is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.010 | 1.2.5.1.8 | Navigate URL is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.011 | 1.2.5.1.9 | Object Caching Protection is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.012 | 1.2.5.1.10 | Protection From Zone Elevation is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.013 | 1.2.5.1.11 | Restrict ActiveX Install is set to Enabled | High |
| MP.JL.CISOFFINT.L1.014 | 1.2.5.1.12 | Restrict File Download is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.015 | 1.2.5.1.13 | Saved from URL is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.016 | 1.2.5.1.14 | Scripted Window Security Restrictions is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.017 | 1.2.6.1 | Enable Automatic Updates is set to Enabled | High |
| MP.JL.CISOFFINT.L1.018 | 1.2.6.2 | Hide option to enable or disable updates is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.019 | 2.1.1.3.2.2 | Access: Block macros from running in Office files from the internet is set to Enabled | High |
| MP.JL.CISOFFINT.L1.020 | 2.1.1.3.2.3 | Access: Disable Trust Bar Notification for unsigned application add-ins and block them is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.021 | 2.1.1.3.2.4 | Access: Require that application add-ins are signed by Trusted Publisher is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.022 | 2.1.1.3.2.1.1 | Access: Allow Trusted Locations on the network is set to Disabled | High |
| MP.JL.CISOFFINT.L1.023 | 2.1.1.4.1.1 | Underline hyperlinks is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.024 | 2.1.4.1 | Default file format is set to Enabled: Access 2007 | Medium |
| MP.JL.CISOFFINT.L1.025 | 2.1.4.2 | Do not prompt to convert older databases is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.026 | 2.1.5.1 | Modal Trust Decision Only is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.027 | 2.2.2.1 | Do not show data extraction options when opening corrupt workbooks is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.028 | 2.2.4.1.2 | Ask to update automatic links is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.029 | 2.2.4.1.1.1 | Load Pictures from Web pages not created in Excel is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.030 | 2.2.4.2.1 | Internet and network paths as hyperlinks is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.031 | 2.2.4.6.1 | Default file format is set to Enabled: Excel Workbook (*.xlsx) | High |
| MP.JL.CISOFFINT.L1.032 | 2.2.4.6.2 | Disable AutoRepublish is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.033 | 2.2.4.6.3 | Do not show AutoRepublish warning alert is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.034 | 2.2.4.7.3 | Force file extension to match file type is set to Enabled: Always match file type | Medium |
| MP.JL.CISOFFINT.L1.035 | 2.2.4.7.4 | Scan encrypted macros in Excel Open XML workbooks is set to Enabled: Scan encrypted macros (default) | Medium |
| MP.JL.CISOFFINT.L1.036 | 2.2.4.7.5 | Excel: Turn off file validation is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.037 | 2.2.4.7.6 | WEBSERVICE Function Notification Settings is set to Enabled: Disable all with notification or Disable all without notification | Medium |
| MP.JL.CISOFFINT.L1.038 | 2.2.4.7.2.5 | Block Excel XLL Add-ins that come from an untrusted source is set to Enabled: Blocked | Medium |
| MP.JL.CISOFFINT.L1.039 | 2.2.4.7.2.6 | Excel: Block macros from running in Office files from the internet is set to Enabled | High |
| MP.JL.CISOFFINT.L1.040 | 2.2.4.7.2.7 | Excel: VBA Macro Notification Settings is set to Enabled: Disable all except digitally signed macros | High |
| MP.JL.CISOFFINT.L1.041 | 2.2.4.7.2.8 | Prevent Excel from running XLM macros is set to Enabled | High |
| MP.JL.CISOFFINT.L1.042 | 2.2.4.7.2.9 | Excel: Require that application add-ins are signed by Trusted Publisher is set to Enabled | High |
| MP.JL.CISOFFINT.L1.043 | 2.2.4.7.2.10 | Excel: Disable Trust Bar Notification for unsigned application add-ins and block them is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.044 | 2.2.4.7.2.11 | Store macro in Personal Macro Workbook by default is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.045 | 2.2.4.7.2.12 | Excel: Trust access to Visual Basic Project is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.046 | 2.2.4.7.2.1.1 | Always prevent untrusted Microsoft Query files from opening is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.047 | 2.2.4.7.2.1.2 | Don't allow Dynamic Data Exchange (DDE) server launch in Excel is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.048 | 2.2.4.7.2.1.3 | Don't allow Dynamic Data Exchange (DDE) server lookup in Excel is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.049 | 2.2.4.7.2.2.1 | dBase III /IV files is set to Enable: Open/Save blocked, use open policy | Medium |
| MP.JL.CISOFFINT.L1.050 | 2.2.4.7.2.2.2 | Dif and Sylk files is set to Enabled: Open/Save blocked, use open policy | Medium |
| MP.JL.CISOFFINT.L1.051 | 2.2.4.7.2.2.3 | Excel 2 macrosheets and add-in files is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.052 | 2.2.4.7.2.2.4 | Excel 2 worksheets is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.053 | 2.2.4.7.2.2.5 | Excel 3 macrosheets and add-in files is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.054 | 2.2.4.7.2.2.6 | Excel 3 worksheets is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.055 | 2.2.4.7.2.2.7 | Excel 4 macrosheets and add-in files is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.056 | 2.2.4.7.2.2.8 | Excel 4 workbooks is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.057 | 2.2.4.7.2.2.9 | Excel 4 worksheets is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.058 | 2.2.4.7.2.2.10 | Excel 95 workbooks is set to Enabled: Open/Save Blocked, Use Open Policy | High |
| MP.JL.CISOFFINT.L1.059 | 2.2.4.7.2.2.11 | Excel 95-97 workbooks and templates is set to Enabled: Open/Save Blocked, Use Open Policy | High |
| MP.JL.CISOFFINT.L1.060 | 2.2.4.7.2.2.12 | Excel 97-2003 workbooks and templates is set to Enabled: Open/Save Blocked, Use Open Policy | High |
| MP.JL.CISOFFINT.L1.061 | 2.2.4.7.2.2.13 | Excel: Set default file block behavior is set to Enabled: Blocked files are not opened | High |
| MP.JL.CISOFFINT.L1.062 | 2.2.4.7.2.2.14 | Web pages and Excel 2003 XML spreadsheets is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.063 | 2.2.4.7.2.3.1 | Always open untrusted database files in Protected View is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.064 | 2.2.4.7.2.3.2 | Excel: Do not open files from the internet zone in Protected View is set to Disabled | High |
| MP.JL.CISOFFINT.L1.065 | 2.2.4.7.2.3.3 | Excel: Do not open files in unsafe locations in Protected View is set to Disabled | High |
| MP.JL.CISOFFINT.L1.066 | 2.2.4.7.2.3.4 | Excel: Set document behavior if file validation fails is set to Enabled: Open in Protected View | Medium |
| MP.JL.CISOFFINT.L1.067 | 2.2.4.7.2.3.5 | Excel: Set document behavior if file validation fails is set to Unchecked: Do not allow edit | Medium |
| MP.JL.CISOFFINT.L1.068 | 2.2.4.7.2.3.6 | Excel: Turn off Protected View for attachments opened from Outlook is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.069 | 2.2.4.7.2.4.1 | Excel: Allow Trusted Locations on the network is set to Disabled | High |
| MP.JL.CISOFFINT.L1.070 | 2.3.6.2 | Disable UI extending from documents and templates is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.071 | 2.3.9.1 | Document Information Panel Beaconing UI is set to Enabled: Always show UI | Medium |
| MP.JL.CISOFFINT.L1.072 | 2.3.19.1 | Allow users with earlier versions of Office to read with browsers... is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.073 | 2.3.19.2 | Always expand groups in Office when restricting permission for documents is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.074 | 2.3.19.3 | Always require users to connect to verify permission is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.075 | 2.3.19.4 | Never allow users to specify groups when restricting permission for documents is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.076 | 2.3.19.5 | Prevent users from changing permissions on rights managed content is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.077 | 2.3.23.2 | Block signing into Office is set to Enabled: Org ID only | High |
| MP.JL.CISOFFINT.L1.078 | 2.3.23.3 | Control Blogging is set to Enabled: All Blogging Disabled | Medium |
| MP.JL.CISOFFINT.L1.079 | 2.3.24.1 | Block opening of pre-release versions of file formats new to Excel 2016 through the Compatibility Pack for Office 2016 and Excel 2016 Converter is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.080 | 2.3.24.2 | Block opening of pre-release versions of file formats new to PowerPoint 2016 through the Compatibility Pack for Office 2016 and PowerPoint 2016 Converter is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.081 | 2.3.27.4 | ActiveX Control Initialization is set to Enabled: 6 | Medium |
| MP.JL.CISOFFINT.L1.082 | 2.3.27.5 | Allow Basic Authentication prompts from network proxies is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.083 | 2.3.27.6 | Allow VBA to load typelib references by path from untrusted intranet locations is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.084 | 2.3.27.7 | Automation Security is set to Enabled: Disable Macros by default | Medium |
| MP.JL.CISOFFINT.L1.085 | 2.3.27.8 | Control how Office handles form-based sign-in prompts is set to Enabled: Block all prompts | Medium |
| MP.JL.CISOFFINT.L1.086 | 2.3.27.9 | Disable additional security checks on VBA library references that may refer to unsafe locations on the local machine is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.087 | 2.3.27.10 | Disable all Trust Bar notifications for security issues is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.088 | 2.3.27.11 | Disable password to open UI is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.089 | 2.3.27.12 | Encryption mode for Information Rights Management (IRM) is set to Enabled: Cipher Block Chaining (CBC) | Medium |
| MP.JL.CISOFFINT.L1.090 | 2.3.27.13 | Encryption type for password protected Office 97-2003 files is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.091 | 2.3.27.14 | Encryption type for password protected Office Open XML files is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.092 | 2.3.27.15 | Load Controls in Forms3 is set to Enabled: 4 | Medium |
| MP.JL.CISOFFINT.L1.093 | 2.3.27.16 | Macro Runtime Scan Scope is set to Enabled: Enable for all documents | Medium |
| MP.JL.CISOFFINT.L1.094 | 2.3.27.17 | Protect document metadata for password protected files is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.095 | 2.3.27.18 | Protect document metadata for rights managed Office Open XML Files is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.096 | 2.3.27.19 | Suppress hyperlink warnings is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.097 | 2.3.27.3.4 | Allow mix of policy and user locations is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.098 | 2.3.28.2 | Disable the Office client from polling the SharePoint Server for published links is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.099 | 2.3.29.1.1 | Disable Internet Fax feature is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.100 | 2.3.31.1 | Legacy format signatures is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.101 | 2.3.31.2 | Suppress external signature services menu item is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.102 | 2.3.32.1 | Disable Smart Document's use of manifests is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.103 | 2.3.37.3.1 | Open Office documents as read/write while browsing is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.104 | 2.3.39.1 | Send Office Feedback is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.105 | 2.3.39.2 | Automatically receive small updates to improve reliability is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.106 | 2.3.39.3 | Disable Opt-in Wizard on first run is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.107 | 2.3.39.4 | Enable Customer Experience Improvement Program is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.108 | 2.3.39.5 | Send personal information is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.109 | 2.5.1.2.1 | Do not allow users to change permissions on folders is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.110 | 2.5.1.5.1 | Automatically download attachments is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.111 | 2.5.1.5.2 | Do not include Internet Calendar integration in Outlook is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.112 | 2.5.1.6.1 | Download full text of articles as HTML attachments is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.113 | 2.5.1.6.2 | Synchronize Outlook RSS Feeds with Common Feed List is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.114 | 2.5.1.6.3 | Turn off RSS feature is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.115 | 2.5.4.1 | Do not allow Home Page URL to be set in folder Properties is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.116 | 2.5.7.1 | Disable user entries to server list is set to Enabled: Publish default, disallow others | Medium |
| MP.JL.CISOFFINT.L1.117 | 2.5.9.2.1 | PST Null Data on Delete is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.118 | 2.5.10.4.2.2 | Plain Text Options is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.119 | 2.5.10.6.3 | Make Outlook the default program for E-mail, Contacts, and Calendar is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.120 | 2.5.10.6.1.2 | Do not allow folders in non-default stores to be set as folder home pages is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.121 | 2.5.10.8.1.2.1 | Access to published calendars is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.122 | 2.5.10.8.1.2.2 | Prevent publishing to a DAV server is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.123 | 2.5.10.8.1.2.3 | Prevent publishing to Office.com is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.124 | 2.5.10.8.1.2.4 | Restrict level of calendar details users can publish is set to Enabled: Disables Full details and Limited details | Medium |
| MP.JL.CISOFFINT.L1.125 | 2.5.10.8.1.2.5 | Restrict upload method is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.126 | 2.5.10.8.4.1 | Add e-mail recipients to users' Safe Senders Lists is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.127 | 2.5.10.8.4.2 | Hide Junk Mail UI is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.128 | 2.5.10.8.4.3 | Trust e-mail from contacts is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.129 | 2.5.11.1 | Turn off Outlook Social Connector is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.130 | 2.5.14.5 | Disable 'Remember password' for Internet e-mail accounts is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.131 | 2.5.14.6 | Do not automatically sign replies is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.132 | 2.5.14.7 | Prompt user to choose security settings if default settings fail is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.133 | 2.5.14.1.1 | Automatically download content for e-mail from people in Safe Senders and Safe Recipients Lists is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.134 | 2.5.14.1.2 | Block Trusted Zones is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.135 | 2.5.14.1.3 | Display pictures and external content in HTML e-mail is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.136 | 2.5.14.1.4 | Do not permit download of content from safe zones is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.137 | 2.5.14.2.2 | Do not display 'Publish to GAL' button is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.138 | 2.5.14.2.3 | Do not provide Continue option on Encryption warning dialog boxes is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.139 | 2.5.14.2.4 | Message Formats is set to Enabled: S/MIME | Medium |
| MP.JL.CISOFFINT.L1.140 | 2.5.14.2.5 | S/MIME interoperability with external clients is set to Enabled: Handle internally | Medium |
| MP.JL.CISOFFINT.L1.141 | 2.5.14.2.1.1 | Attachment Secure Temporary Folder is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.142 | 2.5.14.2.1.2 | Missing CRLs is set to Enabled: Error | Medium |
| MP.JL.CISOFFINT.L1.143 | 2.5.14.2.1.3 | Missing Root Certificates is set to Enabled: Error | Medium |
| MP.JL.CISOFFINT.L1.144 | 2.5.14.2.1.4 | Promote Level 2 errors as errors, not warnings is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.145 | 2.5.14.3.4 | Outlook Security Mode is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.146 | 2.5.14.3.5 | Allow Active X One Off Forms is set to Enabled: Load only Outlook Controls | Medium |
| MP.JL.CISOFFINT.L1.147 | 2.5.14.3.6 | Allow hyperlinks in suspected phishing e-mail messages is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.148 | 2.5.14.3.7 | Allow scripts in one-off Outlook forms is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.149 | 2.5.14.3.8 | Allow users to demote attachments to Level 2 is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.150 | 2.5.14.3.9 | Authentication with Exchange server is set to Enabled: Kerberos Password Authentication | Medium |
| MP.JL.CISOFFINT.L1.151 | 2.5.14.3.10 | Configure Outlook object model prompt when accessing an address book is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.152 | 2.5.14.3.11 | Configure Outlook object model prompt When accessing the Formula property of a UserProperty object is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.153 | 2.5.14.3.12 | Configure Outlook object model prompt when executing Save As is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.154 | 2.5.14.3.13 | Configure Outlook object model prompt when reading address information is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.155 | 2.5.14.3.14 | Configure Outlook object model prompt when responding to meeting and task requests is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.156 | 2.5.14.3.15 | Display Level 1 attachments is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.157 | 2.5.14.3.16 | Configure Outlook object model prompt when sending mail is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.158 | 2.5.14.3.17 | Do not allow Outlook object model scripts to run for public folders is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.159 | 2.5.14.3.18 | Do not allow Outlook object model scripts to run for shared folders is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.160 | 2.5.14.3.19 | Enable RPC encryption is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.161 | 2.5.14.3.20 | Include Internet in Safe Zones for Automatic Picture Download is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.162 | 2.5.14.3.21 | Junk E-mail protection level is set to Enabled: High | High |
| MP.JL.CISOFFINT.L1.163 | 2.5.14.3.22 | Minimum encryption settings is set to Enabled: 256 | High |
| MP.JL.CISOFFINT.L1.164 | 2.5.14.3.23 | Outlook Security Policy is set to Use Outlook Security Group Policy | Medium |
| MP.JL.CISOFFINT.L1.165 | 2.5.14.3.24 | Prevent users from customizing attachment security settings is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.166 | 2.5.14.3.25 | Remove file extensions blocked as Level 1 is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.167 | 2.5.14.3.26 | Remove file extensions blocked as Level 2 is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.168 | 2.5.14.3.27 | Retrieving CRLs (Certificate Revocation Lists) is set to Enabled: When online always retrieve the CRL | Medium |
| MP.JL.CISOFFINT.L1.169 | 2.5.14.3.28 | Security setting for macros is set to Enabled: Warn for signed, disable unsigned | Medium |
| MP.JL.CISOFFINT.L1.170 | 2.5.14.3.29 | Set Outlook object model custom actions execution prompt is set to Enabled: Automatically Deny | Medium |
| MP.JL.CISOFFINT.L1.171 | 2.5.14.3.30 | Signature Warning is set to Enabled: Always warn about invalid signatures | Medium |
| MP.JL.CISOFFINT.L1.172 | 2.5.14.3.31 | Use Unicode format when dragging e-mail message to file system is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.173 | 2.5.14.3.1.1 | Do not prompt about Level 1 attachments when closing an item is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.174 | 2.5.14.3.1.2 | Do not prompt about Level 1 attachments when sending an item is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.175 | 2.6.6.5.1 | Default file format is set to Enabled: PowerPoint Presentation (*pptx) | High |
| MP.JL.CISOFFINT.L1.176 | 2.6.6.6.3 | PowerPoint: Make hidden markup visible is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.177 | 2.6.6.6.4 | Run Programs is set to Enabled: disable (don't run any programs) | Medium |
| MP.JL.CISOFFINT.L1.178 | 2.6.6.6.5 | Scan encrypted macros in PowerPoint Open XML presentations is set to Enabled: Scan encrypted macros | Medium |
| MP.JL.CISOFFINT.L1.179 | 2.6.6.6.6 | PowerPoint: Turn off file validation is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.180 | 2.6.6.6.7 | Unblock automatic download of linked images is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.181 | 2.6.6.6.2.4 | PowerPoint: Block macros from running in Office files from the Internet is set to Enabled | High |
| MP.JL.CISOFFINT.L1.182 | 2.6.6.6.2.5 | PowerPoint: Require that application add-ins are signed by Trusted Publisher is set to Enabled | High |
| MP.JL.CISOFFINT.L1.183 | 2.6.6.6.2.6 | PowerPoint: Disable Trust Bar Notification for unsigned application add-ins and block them is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.184 | 2.6.6.6.2.7 | PowerPoint: Trust Access to Visual Basic Project is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.185 | 2.6.6.6.2.8 | PowerPoint: VBA Macro Notification Settings is set to Enabled: Disable all except digitally signed macros | High |
| MP.JL.CISOFFINT.L1.186 | 2.6.6.6.2.1.1 | PowerPoint 97-2003 presentations, shows, templates and add-in files is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.187 | 2.6.6.6.2.1.2 | PowerPoint: Set default file block behavior is set to Enabled: Blocked files are not opened | Medium |
| MP.JL.CISOFFINT.L1.188 | 2.6.6.6.2.2.1 | PowerPoint: Do not open files from the Internet zone in Protected View is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.189 | 2.6.6.6.2.2.2 | PowerPoint: Do not open files in unsafe locations in Protected View is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.190 | 2.6.6.6.2.2.3 | PowerPoint: Set document behavior if file validation fails is set to Enabled: Open in Protected View | Medium |
| MP.JL.CISOFFINT.L1.191 | 2.6.6.6.2.2.4 | PowerPoint: Set document behavior if file validation fails is set to Unchecked: Do not allow edit | Medium |
| MP.JL.CISOFFINT.L1.192 | 2.6.6.6.2.2.5 | PowerPoint: Turn off Protected View for attachments opened from Outlook is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.193 | 2.6.6.6.2.3.1 | PowerPoint: Allow Trusted Locations on the network is set to Disabled | High |
| MP.JL.CISOFFINT.L1.194 | 2.8.4.2 | Publisher Automation Security Level is set to Enabled: By UI (prompted) | Medium |
| MP.JL.CISOFFINT.L1.195 | 2.8.4.1.1 | Publisher: Block macros from running in Office files from the internet is set to Enabled | High |
| MP.JL.CISOFFINT.L1.196 | 2.8.4.1.2 | Publisher: Require that application add-ins are signed by Trusted Publisher is set to Enabled | High |
| MP.JL.CISOFFINT.L1.197 | 2.8.4.1.3 | Publisher: Disable Trust Bar Notification for unsigned application add-ins and block them is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.198 | 2.8.4.1.4 | Publisher: VBA Macro Notification Settings is set to Enabled: Disable all except digitally signed macros | High |
| MP.JL.CISOFFINT.L1.199 | 2.11.8.1.2 | Update automatic links at Open is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.200 | 2.11.8.3.1 | Hidden text is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.201 | 2.11.8.6.1 | Default file format is set to Enabled: Word Document (.docx) | Medium |
| MP.JL.CISOFFINT.L1.202 | 2.11.8.7.3 | Word: Make hidden markup visible is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.203 | 2.11.8.7.4 | Word: Turn off file validation is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.204 | 2.11.8.7.2.4 | Word: Block macros from running in Office files from the Internet is set to Enabled | High |
| MP.JL.CISOFFINT.L1.205 | 2.11.8.7.2.5 | Dynamic Data Exchange is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.206 | 2.11.8.7.2.6 | Word: Require that application add-ins are signed by Trusted Publisher is set to Enabled | High |
| MP.JL.CISOFFINT.L1.207 | 2.11.8.7.2.7 | Word: Disable Trust Bar Notification for unsigned application add-ins and block them is set to Enabled | Medium |
| MP.JL.CISOFFINT.L1.208 | 2.11.8.7.2.8 | Scan encrypted macros in Word Open XML Documents is set to Enabled: Scan encrypted macros (default) | Medium |
| MP.JL.CISOFFINT.L1.209 | 2.11.8.7.2.9 | Word: Trust access to Visual Basic Project is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.210 | 2.11.8.7.2.10 | Word: VBA Macro Notification Settings is set to Enabled: Disable all except digitally signed macros | High |
| MP.JL.CISOFFINT.L1.211 | 2.11.8.7.2.1.1 | Word: Set default file block behavior is set to Enabled: Blocked files are not opened | High |
| MP.JL.CISOFFINT.L1.212 | 2.11.8.7.2.1.2 | Word 2 and earlier binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.213 | 2.11.8.7.2.1.3 | Word 2000 binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.214 | 2.11.8.7.2.1.4 | Word 2003 binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.215 | 2.11.8.7.2.1.5 | Word 2007 and later binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.216 | 2.11.8.7.2.1.6 | Word 6.0 binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.217 | 2.11.8.7.2.1.7 | Word 95 binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.218 | 2.11.8.7.2.1.8 | Word 97 binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.219 | 2.11.8.7.2.1.9 | Word XP binary documents and templates is set to Enabled: Open/Save blocked, use open policy | High |
| MP.JL.CISOFFINT.L1.220 | 2.11.8.7.2.2.1 | Word: Do not open files from the internet zone in Protected View is set to Disabled | High |
| MP.JL.CISOFFINT.L1.221 | 2.11.8.7.2.2.2 | Word: Do not open files in unsafe locations in Protected View is set to Disabled | High |
| MP.JL.CISOFFINT.L1.222 | 2.11.8.7.2.2.3 | Word: Set document behavior if file validation fails is set to Enabled: Open in Protected View | Medium |
| MP.JL.CISOFFINT.L1.223 | 2.11.8.7.2.2.4 | Word: Set document behavior if file validation fails is set to Unchecked: Do not allow edit | Medium |
| MP.JL.CISOFFINT.L1.224 | 2.11.8.7.2.2.5 | Word: Turn off Protected View for attachments opened from Outlook is set to Disabled | Medium |
| MP.JL.CISOFFINT.L1.225 | 2.11.8.7.2.3.1 | Word: Allow Trusted Locations on the network is set to Disabled | High |
