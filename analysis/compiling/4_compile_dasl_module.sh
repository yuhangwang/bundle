# usage: f=file.dasl o=file.o $0 CFLAGS... -> file.o
compile_dasl_module() {
    ./luajit dynasm.lua $f | filename=$f f=- compile_lua_module "$@"
}