Add-Type -Assembly "System.IO.Compression.FileSystem"

[IO.Compression.ZipFile]::CreateFromDirectory( `
            'C:\Temp\SourceDir', `
            'C:\Temp\SourceDir.zip') 
