$Jira = Read-Host 'Enter JIRA without prefix'

$proxyurl = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy("http://www.google.com")

$requestUri = "https://standardbank.jira.com/rest/api/latest/issue/MRS-$jIRA"

$response = Invoke-RestMethod `
    -Uri $requestUri `
    -Method GET `
    -Headers $headers `
    -Proxy $proxyurl.AbsoluteUri `
    -ProxyUseDefaultCredentials `
    -Verbose `
    -ContentType "application/json" `
    -UserAgent ""

Write-Output "ID: $($response.id)"
Write-Output "Key: $($response.key)"
Write-Output "Self: $($response.self)"
Write-Output "Status: $($response.fields.status.name)"
Write-Output "Description: $($response.fields.description)"
Write-Output "Summary: $($response.fields.summary)"
foreach($component in $response.fields.components)
{
    Write-Output "Component: $($component.name)"    
}
Write-Output "Priority: $($response.fields.priority.name)"
Write-Output "Assignee: $($response.fields.assignee.name)"
