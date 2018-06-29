
Clear-Host

$securePassword = Read-Host 'Enter Password' -AsSecureString
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword))

[string] $target = "https://$org.jira.com"
[string] $username = "$firstName.$lastName"
[string] $projectKey = "MRS";

## Editable fields
[string] $issueType = "Task"
[string] $summary = "Summary 2"
[string] $description = "Description 2"
[string] $priority = "Low"
## Editable fields

$proxyurl = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy("http://www.google.com")

[string] $body = 
        "{
           `"fields`":{
              `"project`":{
                 `"key`":`"$projectKey`"
              },
              `"issuetype`":{
                 `"name`":`"$issueType`"
              },
              `"summary`":`"$summary`",
              `"description`":`"$description`",
              `"priority`":{
                 `"name`":`"$priority`"
              },
              `"assignee`":{
                 `"name`":`"$username`"
              }
           }
        }"
    #`"fields`":{`"project`":{`"key`":`"$projectKey`"},`"issuetype`":{`"name`":`"$issueType`"},`"summary`":`"$summary`",`"description`":`"$description`",`"priority`":{`"name`":`"$priority`"}}}"

$basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
$headers = @{
    "Authorization"=$basicAuth
    "X-Atlassian-Token"="nocheck"
}

$requestUri = "$target/rest/api/latest/issue"

$response = Invoke-RestMethod `
    -Uri $requestUri `
    -Method POST `
    -Headers $headers `
    -Body $body `
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
Write-Output "Priority: $($response.fields.priority)"
