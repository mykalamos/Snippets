Param([string]$configuration="Debug")

$checkoutDir="$PSScriptRoot\..\.."
$srcRoot="$checkoutDir\src"
$nunitConsole="$checkoutDir\src\packages\NUnit.ConsoleRunner.3.8.0\tools\nunit3-console.exe"
$dotCoverRoot="$PSScriptRoot\..\..\..\..\tools\dotCover"
$dotCoverOutputFile="$checkoutDir\dotCover_output.html"
$filters="-:type=$appPrefix.*Tests.*;+:type=$appPrefix.*;"
$targetAssemblyPrefix="<Prefix>.*Tests"
$attributeFilters="System.Diagnostics.CodeAnalysis.ExcludeFromCodeCoverageAttribute"

Push-Location $srcRoot
pwd

# N.B. We're ignoring the Integration Tests for now
$testFileList = `
( `
	ls -Recurse `
	| Where-Object { `
			$_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Unit.dll" `
		-or $_.FullName -like "*\bin\$configuration\$targetAssemblyPrefix.Integration.dll" } `
	| sort-object -Unique Name `
	| % FullName `
)

Push-Location $dotCoverRoot
pwd

$cmdLine = "$dotCoverRoot\dotCover.exe analyse /TargetExecutable=`"$nunitConsole`" /TargetArguments=`"$testFileList`" /Output=`"$dotCoverOutputFile`" /ReportType=HTML /Filters=`"$filters`" /AttributeFilters=`"$attributeFilters`""

echo $cmdLine

Invoke-Expression $cmdLine

Pop-Location

exit $LASTEXITCODE
