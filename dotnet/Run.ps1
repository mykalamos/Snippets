Param(
  [string] $Configuration='Debug',
  [string] $LaunchProfile='MyLaunchProfile')

Write-Output "*** Executing $($MyInvocation.MyCommand.Name) ***"

dotnet run -p "MyProjectFolder" --no-build --configuration $Configuration --launch-profile $LaunchProfile
