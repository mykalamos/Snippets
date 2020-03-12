[string] $7za = 'C:\Program Files (x86)\Red Gate\DLM Dashboard 1\7-Zip\7za.exe'
Get-ChildItem $path -recurse -filter *.gz | 
   foreach-object { & $7za e $_.FullName "-o$($_.Directory)" }
