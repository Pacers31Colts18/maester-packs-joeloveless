# Joe Loveless Maester Packs

[Maester Packs](https://maester.dev/docs/packs) that check Intune policy configuration against security baselines.
One pack per baseline profile, one test per setting. Every pack needs Maester 3.0 or later.

## Packs

| Pack | Folder | Code | Checks |
| --- | --- | --- | --- |
| CIS Windows 11 Intune L1 | [cis-win11-intune-l1](cis-win11-intune-l1/README.md) | `JL.CISW11INT.L1` | CIS Microsoft Intune for Windows 11 Benchmark v5.0.0, Level 1 |
| CIS Windows 11 Intune BL | [cis-win11-intune-bl](cis-win11-intune-bl/README.md) | `JL.CISW11INT.BL` | CIS Microsoft Intune for Windows 11 Benchmark v5.0.0, BL |
| CIS Apple iOS 26 and iPadOS26 Intune Benchmark | [cis-ios-intune-l1](cis-ios-intune-l1/README.md) | `JL.CISIOSINT.L1` | CIS Apple iOS 26 and iPadOS 26 Intune Benchmark v1.0.0, Level 1 |
| CIS Apple MacOS 26 Tahoe Intune Benchmark | [cis-macos-intune-l1](cis-macos-intune-l1/README.md) | `JL.CISMACINT.L1` | CIS Apple MacOS 26 Tahoe Intune Benchark v1.0.0, Level 1 |
| CIS Microsoft Intune for Microsoft Defender Antivirus | [cis-win11-defender-intune-l1](cis-win11-defender-intune-l1/README.md) | `JL.CISDEFINT.L1` | CIS Microsoft Intune for Microsoft Defender Antivirus Benchmark v1.0.0, Level 1 |
| CIS Intune for Microsoft Defender Antivirus Benchmark | [cis-defender-intune-l1](cis-defender-intune-l1/README.md) | `JL.CISDEFINT.L1` | CIS Intune for Microsoft Defender Antivirus Benchmark v1.0.0, Level 1 |
| CIS Intune for Microsoft Defender Antivirus Benchmark | [cis-defender-intune-l1](cis-defender-intune-l1/README.md) | `JL.CISDEFINT.L1` | CIS Intune for Microsoft Defender Antivirus Benchmark v1.0.0, Level 1 |

## Install and run

    Install-MtPack Pacers31Colts18/maester-packs-joeloveless/<folder>
    Connect-Maester
    Invoke-Maester -Pack <code>

Test IDs are `MP.<code>.<number>`, numbered in the order tests are added, such as `MP.JL.CISW11INT.L1.001`.
Each test's description names the CIS recommendation it checks.

## Repository layout

| Path | Contents |
| --- | --- |
| `<folder>/` | One pack: `maester-pack.json`, `maester-pack.guide.json`, `README.md`, `helpers/`, `tests/` |
| `<folder>/tests/` | `suite.json`, `frameworks/<key>.json` (requirement IDs and levels, no benchmark text), and one `Test.<ID>.ps1` + `Test.<ID>.md` per setting |
| `shared/helpers/` | The helper functions every pack uses. Change them here only; `tools/Sync-Helpers.ps1` copies them into each pack |
| `tests/shared/` | Pester tests of the shared helpers against faked Graph (`tests/<folder>/` for tests of one pack). Not installed with any pack |
| `.github/` | The CI workflow, issue templates (bug report, setting request) and the pull request checklist |
| `tools/` | `Test-Pack.ps1` (the checks CI runs) and `Sync-Helpers.ps1`, thin wrappers around [JLMaesterTools](https://github.com/Pacers31Colts18/maester-pack-tools-joeloveless), which they load from a clone next to this repository |

## Develop

Clone [maester-pack-tools-joeloveless](https://github.com/Pacers31Colts18/maester-pack-tools-joeloveless) next to this
repository; it has the functions that create packs and tests (`New-JLMaesterPack`, `New-JLMaesterTest`,
`Find-JLIntuneSetting`) and the checks the scripts below run.

```powershell
Install-PSResource Maester -Prerelease     # until Maester 3.0 is released
Import-Module ../maester-pack-tools-joeloveless/JLMaesterTools/JLMaesterTools.psd1
New-JLMaesterTest -Pack cis-win11-intune-l1 -Recommendation 1.2 ... -WhatIf   # draft a test; see Get-Help New-JLMaesterTest
./tools/Sync-Helpers.ps1                   # after changing shared/helpers
./tools/Test-Pack.ps1                      # pack checks
Invoke-Pester ./tests                      # helper tests
Connect-Maester; Invoke-MtTest -Path ./cis-win11-intune-l1   # against your tenant
```

## Releases

Each pack has its own `Version` in its `maester-pack.json`. A release is tagged `<folder>-v<version>`, such as
`cis-win11-intune-l1-v0.1.0`, with its notes under `## <folder> <version>` in [CHANGELOG.md](CHANGELOG.md). After a
push to `main` passes the checks, the workflow publishes every pack version that has no release yet (only when the
repository variable `PACK_RELEASES` is `true`). Keep each pack's `Guid` and `Code` for good.

## License

[MIT](LICENSE). The CIS Benchmarks are © Center for Internet Security and are not included here; the tests name the
recommendation numbers they check and describe them in their own words.
