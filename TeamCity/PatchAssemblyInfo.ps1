Param(
	[string]$globalAssemblyInfoPath,
	[string]$gitSha1,
	[string]$buildNumber
)

$titleReplacement = '$1Git SHA1:' + $gitSha1 +'$2'
$buildNumberReplacement = '$1"' + $buildNumber + '"$2' # Seems to be issue with replacement when matching on "

(Get-Content $globalAssemblyInfoPath) `
-replace '(\[assembly: AssemblyTitle\(").*("\)\])', $titleReplacement `
-replace '^\s*(\[assembly: AssemblyVersion\()".*"(\)\])', $buildNumberReplacement |
Out-File $globalAssemblyInfoPath
