Param(
	[string] $branch,
	[string] $buildCounter,
	[string] $gitSha1
)

# %system.MRSVersion%.%system.MRSPatchVersion%.%build.counter%.%build.vcs.number%
# Must come after Param block
Import-Module "$PSScriptRoot\Version.Major.psm1" -Force;
Import-Module "$PSScriptRoot\Version.Minor.psm1" -Force;

Write-Host "*** Executing $($MyInvocation.MyCommand.Name) ***"

[string] $majorVersion = $Global:MajorVersion;
[string] $minorVersion = $Global:MinorVersion;

Write-Host "Major Version: '$majorVersion'"
Write-Host "Minor Version: '$minorVersion'"
Write-Host "Branch Name: '$branch'"
Write-Host "Build Counter: '$buildCounter'"
Write-Host "Git Sha1: '$gitSha1'"

$buildNumber = "$majorVersion.$minorVersion.$buildCounter"
$regexOptions = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

$featureRegex = New-Object System.Text.RegularExpressions.Regex "^feature/.+", $regexOptions
$pullRequestRegex = New-Object System.Text.RegularExpressions.Regex "^(?<pullRequestNumber>\d+)/merge", $regexOptions
$releaseRegex = New-Object System.Text.RegularExpressions.Regex "^release/.+", $regexOptions
$hotfixRegex = New-Object System.Text.RegularExpressions.Regex "^hotfix/.+", $regexOptions
$masterRegex = New-Object System.Text.RegularExpressions.Regex "^master$", $regexOptions

[string] $script:packageVersion;
[string] $script:channelName;
[string] $script:deploymentEnvironment = 'IntegrationTest';

function New-Tuple()
{
    param ( [object[]]$list= $(throw "Please specify the list of names and values") )

    $tuple = new-object psobject
    for ( $i= 0 ; $i -lt $list.Length; $i = $i+2)
    {
        $name = [string]($list[$i])
        $value = $list[$i+1]
        $tuple | add-member NoteProperty $name $value
    }

    return $tuple
}

$feature = New-Tuple Regex,$featureRegex,Func,{param($m)
	Write-Host "Feature branch detected"
	$script:packageVersion = "$buildNumber-branch"
	$script:channelName = "Default"
}

$pullRequest = New-Tuple Regex,$pullRequestRegex,Func,{param($m)
		Write-Host "PR detected"
		$pullRequestNumber = $m.Groups['pullRequestNumber'].Value
		$script:packageVersion = "$buildNumber-PR$pullRequestNumber"
		$script:channelName = "Default"
}

$release = New-Tuple Regex,$releaseRegex,Func,{param($m)
	Write-Host "Release branch detected"
	$script:packageVersion = "$buildNumber-release"
	$script:channelName = "Release"
	$script:deploymentEnvironment = ''
}

$hotfix = New-Tuple Regex,$hotfixRegex,Func,{param($m)
	Write-Host "Hotfix branch detected"
	$script:packageVersion = "$buildNumber-hotfix"
	$script:channelName = "Release"
	$script:deploymentEnvironment = ''
}

$master = New-Tuple Regex,$masterRegex,Func,{param($m)
	Write-Host "Master branch detected"
	$script:packageVersion = $buildNumber
	$script:channelName = "Default"
}

$tuples = @($feature, $pullRequest, $master, $release, $hotfix);

foreach($tuple in $tuples)
{
	$regex = $tuple.Regex;
	$match = $regex.Match($branch)
	if($match.Success)
	{
		&$tuple.Func -m $match
		break;
	}
}

$script:truncatedGitSha1 = $gitSha1.Substring(0, 7);
$script:packageVersion = "$script:packageVersion-$truncatedGitSha1"

Write-Host Package Version: $script:packageVersion;
Write-Host Build Version: $script:buildNumber
Write-Host Channel Name: $script:channelName

Write-Host "##teamcity[buildNumber '$script:packageVersion']"
Write-Host "##teamcity[setParameter name='package.version' value='$script:packageVersion']"
Write-Host "##teamcity[setParameter name='build.version' value='$script:buildNumber']"
Write-Host "##teamcity[setParameter name='channel.name' value='$script:channelName']"
Write-Host "##teamcity[setParameter name='deployment.environment' value='$script:deploymentEnvironment']"

$props = @{
	'PackageVersion' = $script:packageVersion
	'BuildVersion' = $script:buildNumber
	'ChannelName' = $script:channelName
}
return New-Object -Type PSObject -Prop $props
