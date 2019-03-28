Get-Childitem -Path c:\temp -File -Recurse | ForEach-Object {
    $a=$_.Name
    $b=$a -replace "UnwantedString",""

    If ($a -ne $b) { 
        Write-Host $a => $b;
        Rename-Item $a $b;
    }
};

# -File can be replaced with -Directory but both dont seem to work together
