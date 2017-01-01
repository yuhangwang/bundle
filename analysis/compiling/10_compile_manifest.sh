# add a manifest file to enable the exe to use comctl 6.0
# usage: $0 file.manifest -> _manifest.o
compile_manifest() {
    [ $OS = mingw ] || return
    local f=$1; shift
    [ "$f" ] || return
    sayt manifest $f
    s="\
        #include \"winuser.h\"
        1 RT_MANIFEST $f
        " o=$ODIR/_manifest.o compile_resource
}