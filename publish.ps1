if (!(Test-Path publish)) {
    mkdir publish
}

cp ./* -Filter "*.png" -Destination publish/
cp ./* -Filter "*.wav" -Destination publish/
cp ./* -Filter "*.mp3" -Destination publish/
cp "skin.ini" publish/
