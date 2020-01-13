# Need to run as admin
# aliases don't seem to work so use machine name
clear-host

$source = 'mySourceMachine'
$target = 'myTargetMachine'
$serverToken = '<Server>';

$dirs = "\\$serverToken\MyShare", `
        "\\$serverToken\MyShare\Directory1", `
        "\\$serverToken\MyShare\Directory2" `
;

foreach($dir in $dirs){
    $acl = Get-Acl $dir.Replace($serverToken, $source);
    Set-Acl $dir.Replace($serverToken, $target) $acl
    Write-Host Completed $dir as ([System.DateTime]::Now);
}
