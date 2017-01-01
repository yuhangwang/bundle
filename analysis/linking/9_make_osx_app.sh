# usage: EXE=exefile [ICON=iconfile] $0
make_osx_app() {
    local exename="$(basename "$EXE")"
    local cdir="$EXE.app/Contents"

    # make the app contents dir and move the exe to it
    mkdir -p "$cdir/MacOS"
    mv -f "$EXE" "$cdir/MacOS/$exename"

    # create a bare-minimum info.plist file
    (
        echo '<?xml version="1.0" encoding="UTF-8"?>'
        echo '<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
        echo '<plist version="1.0">'
        echo '<dict>'
        echo "<key>CFBundleExecutable</key><string>$exename</string>"
        echo "<key>CFBundleIconFile</key><string>icon.icns</string>"
        echo "</dict></plist>"
    ) > "$cdir/Info.plist"

    # convert/copy the icon file
    [ "$ICON" ] && {
        local ext="${ICON##*.}"
        local icns="$cdir/Resources/icon.icns"
        mkdir -p "$(dirname "$icns")"
        if [ "$ext" = "png" ]; then
            make_icns "$ICON" "$icns"
        elif [ "$ext" = "icns" ]; then
            cp -f "$ICON" "$icns"
        else
            die "Unknown icon type: $ext"
        fi
    }
}