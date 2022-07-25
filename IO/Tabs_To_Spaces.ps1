$ErrorActionPreference = "Stop";
$root = "<root>";

Set-Variable -Name tabReplacement -Value (' ' * 4) -Option ReadOnly -Force
Set-Variable -Name fileExtensions -Value *.cs, *.ps1, *.psm1, *.csproj -Option ReadOnly -Force

gci $root -Recurse -Include $fileExtensions | % {
    if ($_.FullName -match '\\obj\\') {
        Write-Host "Exclude: $($_.FullName)"
    }
    else {
        Write-Host $_.FullName;
    (Get-Content $_) | % { $_ -Replace "`t", $tabReplacement } | Set-Content $_
    }
}
