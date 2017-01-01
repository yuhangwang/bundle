# usage: P=platform MODULES='mod1 ...' ALIBS='lib1 ...' DLIBS='lib1 ...'
#         MAIN=module EXE=exe_file NOCONSOLE=1 ICON=icon COMPRESS_EXE=1 $0
bundle() {
    say "Bundle parameters:"
    say "  Platform:      " "$OS ($P)"
    say "  Modules:       " $MODULES
    say "  Static libs:   " $ALIBS
    say "  Dynamic libs:  " $DLIBS
    say "  Main module:   " $MAIN
    say "  Icon:          " $ICON
    compile_all
    link_all
    compress_exe
    say "Done."
}