# Mass downscale HD osu! skin files to SD in the current directory.

foreach ($_ in (ls -Filter "*@2x.png")) {
    $downscaledFileName = ($_.Name.Substring(0, $_.Name.IndexOf("@"))+".png")
    if (Test-Path $downscaledFileName) {
        $downscaledFile = Get-Item -Path $downscaledFileName

        if ($downscaledFile.LastWriteTime -gt $_.LastWriteTime) {
            echo ($downscaledFile.Name + " is newer -- skipping")
            continue
        }
    }

    echo ("Downscaling " + $_.Name)
    magick $_.Name -resize "50%" $downscaledFileName
}
