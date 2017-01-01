# usage: [ filename=file.lua ] f=file.lua|- o=file.o $0 CFLAGS... -> file.o
compile_lua_module() {
    ./luajit -b -t raw -g $f $o.luac
    local sym=$filename
    [ "$sym" ] || sym=$f
    sym=${sym#bin/$P/lua/}       # bin/<platform>/lua/a.lua -> a.lua
    sym=${sym%.lua}              # a.lua -> a
    sym=${sym%.dasl}             # a.dasl -> a
    sym=${sym//[\-\.\/\\]/_}     # a-b.c/d -> a_b_c_d
    sym=$BLUA_PREFIX$sym f=$o.luac compile_bin_file "$@"
}
