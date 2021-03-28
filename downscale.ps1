ls -Filter "*@2x.png" | foreach {
    echo ("Downscaling " + $_.Name)
    magick $_.Name -resize "50%" ($_.Name.Substring(0, $_.Name.IndexOf("@"))+".png")
}