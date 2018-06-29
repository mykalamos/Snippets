Param(
	[string]$configuration="Debug",
	[string]$assembliesInParallel=$True
	)

$srcRoot="$PSScriptRoot\..\..\src"
$targetAssemblyPrefix="XYZ.*Tests"

Push-Location $srcRoot
pwd

$nunitArgs += " --teamcity --dispose-runners"

if ([System.Boolean]::Parse($assembliesInParallel) -eq $False)
{
	Write-Host "Assemblies will be run in series"
	$nunitArgs += " --inprocess"
}

$cmdLine = "$srcRoot\packages\NUnit.ConsoleRunner.3.8.0\tools\nunit3-console.exe " + `
( `
	ls -Recurse `
	| Where-Object { `
			$_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Unit.dll" `
		-or $_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Integration.dll" } `
	| sort-object -Unique Name `
	| % FullName `
) + $nunitArgs

echo $cmdLine

Invoke-Expression $cmdLine

Pop-Location

if($error.Count -gt 0)
{
	Write-Error -Message $error[0].Exception.Message
	exit(1)
}

exit $LASTEXITCODE
