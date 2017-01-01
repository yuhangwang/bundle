# usage: LDFLAGS=... P=platform ALIBS='lib1 ...' DLIBS='lib1 ...' \
#          EXE=exe_file NOCONSOLE=1 $0
link_mingw() {

    local mingw_lib_dir
    if [ $P = mingw32 ]; then
        mingw_lib_dir="$(dirname "$(which gcc)")/../lib"
    else
        mingw_lib_dir="$(dirname "$(which gcc)")/../x86_64-w64-mingw32/lib"
    fi

    local xopt
    # make a windows app or a console app
    [ "$NOCONSOLE" ] && xopt="$xopt -mwindows"

    verbose g++ $LDFLAGS $OFILES -o "$EXE" \
        -static -static-libgcc -static-libstdc++ \
        -Wl,--export-all-symbols \
        -Wl,--whole-archive `aopt "$ALIBS"` \
        -Wl,--no-whole-archive \
        `lopt "$DLIBS"` $xopt
}