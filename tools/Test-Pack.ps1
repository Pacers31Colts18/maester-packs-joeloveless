<#
.SYNOPSIS
    The checks CI runs, for every pack folder (or the ones named). Runs Test-JLMaesterPack from JLMaesterTools.

.EXAMPLE
    ./tools/Test-Pack.ps1

.EXAMPLE
    ./tools/Test-Pack.ps1 -Pack cis-win11-intune-l1
#>
[CmdletBinding()]
param([string[]] $Pack)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Import-JLMaesterTools.ps1')
# Pass -InformationAction through only when given, so the module's default (progress shown) applies otherwise.
$quiet = @{}
if ($PSBoundParameters.ContainsKey('InformationAction')) { $quiet.InformationAction = $PSBoundParameters['InformationAction'] }
Test-JLMaesterPack -RepoPath (Split-Path -Parent $PSScriptRoot) -Pack $Pack @quiet
