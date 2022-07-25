Write-Host "*** Running $($MyInvocation.MyCommand.Name) ***"
$tool = "dotnet-reportgenerator-globaltool"
# dotnet tool install -g dotnet-reportgenerator-globaltool TODO make this a step
$matchingOutput = dotnet tool list --global | Select-String -Pattern $tool  -Quiet;
Write-Host $matchingOutput
if ($matchingOutput -eq $True)
{
	Write-Host "$tool already installed"
} 
else
{
	Write-Host "$tool not found. Installing ..."
	dotnet tool install -g $tool
}