Write-Output "*** Executing $($($MyInvocation.MyCommand.Name)) ***"

[string] $curlPath = "curl\curl-7.63.0-win64-mingw\bin\curl.exe";
[string] $url = "http://server/app/api/v1.0/Controller/Method";
[array] $headers = &$curlPath -X GET -I $url --retry 3 --retry-delay 2 -s

foreach($header in $headers)
{
	Write-Host "Header=$header"
	if($header -eq 'HTTP/1.1 200 OK')
	{
		return 0;
	}
}
return 1;
