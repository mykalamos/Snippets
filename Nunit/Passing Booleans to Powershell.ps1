# use curly braces around arguments to make sure bool is evaluated correctly with File mode
powershell -NonInteractive -ExecutionPolicy ByPass -File "MyPowershellScript.ps1" {-configuration Release -assembliesInParallel $True}
