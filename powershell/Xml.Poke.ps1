[string] $configPath = 'c:\temp\AppSettings.config';
[xml] $xml = Get-Content $configPath
$node = $xml.SelectSingleNode('//appSettings/add[@key="TimeoutValue"]')
$node.Value = '10:00:00';
$xml.Save($configPath);
