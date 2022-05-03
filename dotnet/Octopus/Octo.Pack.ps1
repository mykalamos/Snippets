Param(
	[string] $PackageVersion='0.0.0',
	[string] $BuildVersion='0.0.0',
	[string] $Configuration='Release'
)

Write-Output "*** Executing $($MyInvocation.MyCommand.Name) ***"

[string] $hostRoot = "$PSScriptRoot\..\..\src\MyHost"
& dotnet publish "$hostRoot\" --no-restore -c $Configuration /p:Version=$BuildVersion

& dotnet octo pack `
	--id MyPackageId `
	--version $PackageVersion `
	--basePath "$hostRoot\bin\$Configuration\net6.0\publish" `
	--outFolder "$hostRoot\bin\$Configuration\" `
	--overwrite	`
	;
