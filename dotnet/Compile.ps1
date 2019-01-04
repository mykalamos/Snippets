Param(
	[string] $Configuration='Debug',
	[string] $Version="0.0.0"
)

Write-Output "*** Executing $($MyInvocation.MyCommand.Name) ***"

& dotnet build "MySolution.sln" -c $Configuration --no-restore /p:Version=$Version
exit $LastExitCode
