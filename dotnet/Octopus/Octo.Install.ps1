# One-off script
& dotnet tool install Octopus.DotNet.Cli `
	--global `
	--version 4.41.0 `
	--add-source $PSScriptRoot\..\..\packages\Octopus.DotNet.Cli\ `
	--configfile $PSScriptRoot\Dotnet.Octo.Install.Nuget.config; # Nuget config file
