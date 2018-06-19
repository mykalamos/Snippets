Param
(
    [string]$sonarQubeReportTaskFilePath
)

$reportTask = Get-Content $sonarQubeReportTaskFilePath -Raw

$regexOptions = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
$regexPattern = "ceTaskUrl=(?<url>[^$\s\r\n]+)[$\s\r\n]"
$regex = New-Object System.Text.RegularExpressions.Regex $regexPattern, $regexOptions

$match = $regex.Match($reportTask)

if($match.Success)
{
    $taskIdUrl = $match.Groups['url'].Value
    Write-Host Match found: $taskIdUrl
} 
else 
{
    Write-Error -Message "Match not found for pattern '$regexPattern' in $reportTask"
    exit(1)
}

$retries = 3

for($i=1; $i -le $retries+1; $i++)
{
	$taskIdJson = Invoke-RestMethod -Uri $taskIdUrl
	$taskIdStatus = $taskIdJson.task.status

	if($taskIdStatus -eq "SUCCESS")
	{
		break;
	}
	$seconds = [System.Convert]::ToInt32([System.Math]::Pow(2, $i))
	Write-Host "taskIdStatus = $taskIdStatus. Retrying in $seconds seconds"
	Start-Sleep -s $seconds
}

if($taskIdStatus -ne "SUCCESS")
{
    Write-Error -Message "Status: '$taskIdStatus'. Exiting ..."
    exit(1)
}

$analysisId = $taskIdJson.task.analysisId
$analysisUrl = "http://cibldnlappvd106:9000/api/qualitygates/project_status?analysisId=$analysisId"

Write-Host "Analysis URL = $analysisUrl"

$analysisIdJson = Invoke-RestMethod -Uri $analysisUrl

$failed = $false
foreach($analysisCondition in $analysisIdJson.projectStatus.conditions)
{
    Write-Host $analysisCondition.metricKey -> $analysisCondition.status
    if($analysisCondition.status -ne "OK")
    {
        $failed = $true
    }
}

if($failed -eq $true)
{
	Write-Error -Message 'At least one analysis condition failed'
    exit(1)
}
