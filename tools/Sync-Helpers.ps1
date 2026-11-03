<#
.SYNOPSIS
    Copies shared/helpers into every pack; -Check only compares. Runs Sync-JLMaesterHelper from JLMaesterTools.

.EXAMPLE
    ./tools/Sync-Helpers.ps1

.EXAMPLE
    ./tools/Sync-Helpers.ps1 -Check
#>
[CmdletBinding()]
param([switch] $Check)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Import-JLMaesterTools.ps1')
# Pass -InformationAction through only when given, so the module's default (progress shown) applies otherwise.
$quiet = @{}
if ($PSBoundParameters.ContainsKey('InformationAction')) { $quiet.InformationAction = $PSBoundParameters['InformationAction'] }
Sync-JLMaesterHelper -RepoPath (Split-Path -Parent $PSScriptRoot) -Check:$Check @quiet
