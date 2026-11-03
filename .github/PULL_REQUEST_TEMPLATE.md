**What this changes**
<!-- Pack(s) and test ID(s). -->

**Checklist**

- [ ] `./tools/Test-Pack.ps1` passes (pack valid, Low risk, no findings, helpers in sync)
- [ ] `Invoke-Pester ./tests` passes
- [ ] Helper changes were made in `shared/helpers/` and synced with `./tools/Sync-Helpers.ps1`, not in a pack's `helpers/`
- [ ] New or changed tests: `.md` written in your own words (no benchmark text), requirement added to `tests/frameworks/<key>.json`
- [ ] Pack `Version` bumped in `maester-pack.json`, with a `## <folder> <version>` entry in `CHANGELOG.md`
- [ ] Run against a tenant: `Invoke-MtTest -Path ./<folder> -Id <test id>` (say which result you got)
