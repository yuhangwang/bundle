# usage: LDFLAGS=... P=platform ALIBS='lib1 ...' DLIBS='lib1 ...' EXE=exe_file $0
link_osx() {
    # note: luajit needs these flags for OSX/x64, see http://luajit.org/install.html#embed
    local xopt; [ $P = osx64 ] && xopt="-pagezero_size 10000 -image_base 100000000"
    # note: using -stdlib=libstdc++ because in 10.9+, libc++ is the default.
    verbose g++ $LDFLAGS $OFILES -o "$EXE" \
        -mmacosx-version-min=10.6 \
        -stdlib=libstdc++ \
        -Lbin/$P \
        `lopt "$DLIBS"` \
        `fopt "$FRAMEWORKS"` \
        -Wl,-all_load `aopt "$ALIBS"` $xopt
    chmod +x "$EXE"
    install_name_tool -add_rpath @loader_path/ "$EXE"
    # make a minimal app bundle if necessary
    [ "$NOCONSOLE" ] && make_osx_app
}