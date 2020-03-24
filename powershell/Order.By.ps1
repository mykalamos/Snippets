Clear-Host
Get-Process | ? {$_.Name -eq 'svchost'} | % {New-Object psobject -Property @{ Id = [int]($_.Id)}} | sort -Descending -Property Id
