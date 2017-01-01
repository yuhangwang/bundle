# usage: MODULES='mod1 ...' $0 -> $ODIR/*.o
compile_all() {
    say "Compiling modules..."

    # the dir where .o files are generated
    ODIR=.bundle-tmp/$P
    mkdir -p $ODIR || { echo "Cannot mkdir $ODIR"; exit 1; }

    # the compile_*() functions will add the names of all .o files to this var
    OFILES=

    # the icon has to be linked first, believe it!
    # so we compile it first so that it's added to $OFILES first.
    compile_icon "$ICON"
    compile_manifest "bin/mingw32/luajit.exe.manifest"

    # compile all the modules
    for m in $MODULES; do
        compile_module $m
    done
    for m in $BIN_MODULES; do
        mtype=bin compile_module $m
    done

    # compile bundle.c which implements bundle_add_loaders() and bundle_main().
    local osuffix
    local copt
    [ "$MAIN" ] && {
        # bundle.c is a template: it compiles differently for each $MAIN,
        # so we make a different .o file for each unique value of $MAIN.
        osuffix=_$MAIN
        copt=-DBUNDLE_MAIN=$MAIN
    }
    osuffix=$osuffix compile_bundle_module bundle.c $copt

    # compile our custom luajit frontend which calls bundle_add_loaders()
    # and bundle_main() on startup.
    compile_bundle_module luajit.c
}