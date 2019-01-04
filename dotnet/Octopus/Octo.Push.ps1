Param(
	[string] $Version='0.0.0',
	[string] $Configuration='Release'
)
Write-Output "*** Executing $($MyInvocation.MyCommand.Name) ***"

[string] $server = 'http://octoserver:85';
[string] $apikey = "API-MyAPIKey";
[string] $packagePath = "$Path\$MyProject\bin\$Configuration\$MyProject.$Version.nupkg";

& dotnet octo push --server $server --apikey $apikey --package $packagePath

exit $LastExitCode
