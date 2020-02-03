Get-ChildItem -Recurse -Include *.config | Select-String "Some config" -List | Select Path
