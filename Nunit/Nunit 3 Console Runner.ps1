Param(
	[string]$configuration="Debug",
	[bool]$assembliesInParallel=$True
	)

$srcRoot="$PSScriptRoot\..\..\src"
$targetAssemblyPrefix="MyApp.*Tests"

Push-Location $srcRoot
pwd

if ($assembliesInParallel -eq $False)
{
	Write-Host "Assemblies will be run in series"
	$nunitArgs = " --inprocess"
}

$cmdLine = "$srcRoot\packages\NUnit.ConsoleRunner.3.8.0\tools\nunit3-console.exe " + `
( `
	ls -Recurse `
	| Where-Object { `
			$_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Unit.dll" `
		-or $_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Integration.dll" } `
	| Sort-Object -Unique Name `
	| % FullName `
) + $nunitArgs

echo $cmdLine

Invoke-Expression $cmdLine

Pop-Location

exit $LASTEXITCODE
