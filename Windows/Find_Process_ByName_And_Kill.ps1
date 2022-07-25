$processName = "MyProcess"; # .exe not required
Get-Process $processName | Select -ExpandProperty Id | %{TaskKill.exe /PID $_ /F}
