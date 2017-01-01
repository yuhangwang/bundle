
# usage: $0 infile.png outfile.icns
make_icns() {
    local png="$1"
    local icns="$2"
    local iconset="$icns.iconset"
    rm -rf "$iconset"
    mkdir -p "$iconset"
    for i in $OSX_ICON_SIZES; do
        local i2=$((i*2))
        sips -z $i  $i  "$png" --out "$iconset/icon_${i}x${i}.png" >/dev/null
        sips -z $i2 $i2 "$png" --out "$iconset/icon_${i}x${i}@2x.png" >/dev/null
    done
    rm -f "$icns"
    iconutil -c icns -o "$icns" "$iconset" 2>&1 | grep -v "warning: No image found"
    rm -rf "$iconset"
}