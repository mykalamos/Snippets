Param(
  [string] $Version=0.0.0
)
Write-Output "*** Executing $($MyInvocation.MyCommand.Name) ***"
& dotnet restore "MySolution.sln" --source $pathToPackages /p:Version=$Version
exit $LastExitCode

# Not sure if version is required
# Remove --source to go to Nuget sources
