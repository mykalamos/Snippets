Get-Childitem -Directory -File -Recurse | ForEach-Object {
    $a=$_.Name
    $b=$a -replace "Prefix.OldName","Prefix.NewName"
    If ($a -ne $b) { Rename-Item $a $b }
}
