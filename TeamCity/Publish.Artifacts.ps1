Param(
	[string] $Configuration='Release'
)
Write-Output "##teamcity[publishArtifacts 'src\MyProject\bin\$Configuration\MyProject.*.nupkg']"
