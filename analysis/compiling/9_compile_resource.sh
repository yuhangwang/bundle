# add an icon file for the exe file and main window (Windows only)
# usage: $0 file.ico -> _icon.o
compile_icon() {
    [ $OS = mingw ] || return
    local f=$1; shift
    [ "$f" ] || return
    sayt icon $f
    o=$ODIR/_icon.o s="0  ICON  \"$f\"" compile_resource
}