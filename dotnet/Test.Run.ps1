Write-Host "*** Running $($MyInvocation.MyCommand.Name) ***"

Set-StrictMode -Version 2.0

$coverageFileName = "coverage.cobertura.xml"
$coverageOutputFormat = "cobertura";
$coveragePcThreshold = 75;

$rootPath = "$PSScriptRoot\..\"

$GetCoverageReports = {
	ls -Path $rootPath -Recurse -File -Filter $coverageFileName | select -ExpandProperty FullName 
}

&$GetCoverageReports | Remove-Item -Verbose

&dotnet test $rootPath /p:CollectCoverage=true /p:Threshold=$coveragePcThreshold /p:CoverletOutputFormat=$coverageOutputFormat
$LastExitCode

$outputPaths = [string]::Join(';', (&$GetCoverageReports))

&ReportGenerator -Reports:$outputPaths -TargetDir:"Coverage" -ReportTypes:Html


