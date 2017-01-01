# usage: $0 file.c CFLAGS... -> file.o
compile_bundle_module() {
    local f=$1; shift
    compile_module csrc/bundle/$f -Icsrc/bundle -Icsrc/luajit/src/src "$@"
}
