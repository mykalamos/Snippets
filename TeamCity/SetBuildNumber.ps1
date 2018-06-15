Param(
	[string]$branch,
	[string]$buildCounter,
	[string]$majorVersion,
	[string]$minorVersion
)

Write-Host "Branch Name: '$branch'"

$buildVersion = "$majorVersion.$minorVersion.$buildCounter"
$regexOptions = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
$jiraRegex = New-Object System.Text.RegularExpressions.Regex "^MRS-(?<jiraNumber>\d{4,6}).*", $regexOptions
$jiraMatch = $jiraRegex.Match($branch)

if($jiraMatch.Success)
{
	Write-Host "JIRA number detected"
	$jiraNumber = $jiraMatch.Groups['jiraNumber'].Value
	$packageVersion = "$buildVersion-alpha$jiraNumber"
	$channelName = "Regression.Alpha"
} 
else 
{
	$packageVersion = $buildVersion
	$channelName = "Regression.Master"
}

Write-Host Release Number: $packageVersion
Write-Host Build Version: $buildVersion
Write-Host Channel Name: $channelName

Write-Host "##teamcity[buildNumber '$packageVersion']"
Write-Host "##teamcity[setParameter name='buildVersion' value='$buildVersion']"
Write-Host "##teamcity[setParameter name='channelName' value='$channelName']"
