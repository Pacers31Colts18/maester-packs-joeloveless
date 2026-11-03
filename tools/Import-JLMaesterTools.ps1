# Loads JLMaesterTools for the scripts in tools/. Looks, in order, at JLMAESTERTOOLS_PATH (CI sets it), a clone of
# maester-pack-tools-joeloveless next to this repository, and an installed copy.
$candidates = @(
    $env:JLMAESTERTOOLS_PATH
    (Join-Path $PSScriptRoot '../../maester-pack-tools-joeloveless/JLMaesterTools/JLMaesterTools.psd1')
) | Where-Object { $_ -and (Test-Path -LiteralPath $_) }

if ($candidates) { Import-Module ($candidates | Select-Object -First 1) -Force -ErrorAction Stop }
elseif (Get-Module -ListAvailable JLMaesterTools) { Import-Module JLMaesterTools -ErrorAction Stop }
else {
    throw 'JLMaesterTools not found. Clone https://github.com/Pacers31Colts18/maester-pack-tools-joeloveless next to this repository, or set JLMAESTERTOOLS_PATH to its JLMaesterTools.psd1.'
}
