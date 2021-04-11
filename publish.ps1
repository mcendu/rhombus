function Publish-ChildItem {
    param (
        $Path
    )
    Copy-Item ($Path + "/*") -Filter "*.png" -Destination publish/
    Copy-Item ($Path + "/*") -Filter "*.jpg" -Destination publish/
    Copy-Item ($Path + "/*") -Filter "*.wav" -Destination publish/
    Copy-Item ($Path + "/*") -Filter "*.mp3" -Destination publish/
}

if (!(Test-Path publish)) {
    mkdir publish | Out-Null
}

Publish-ChildItem .
Publish-ChildItem ./taiko

Copy-Item "skin.ini" publish/
Copy-Item "COPYING.md" publish/
Copy-Item "COPYING.OFL" publish/
