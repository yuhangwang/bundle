# usage: P=<platform> $0 basedir/file.lua|.dasl -> file.lua|.dasl
# note: skips test and demo modules, and other platforms modules.
lua_module() {
    local f=$1
    local ext=${f##*.}
    [ "$ext" != lua -a "$ext" != dasl ] && return
    [ "${f%_test.lua}" != $f ] && return
    [ "${f%_demo.lua}" != $f ] && return
    [ "${f#bin/}" != $f -a "${f#bin/$P/}" = $f ] && return
    echo $f
}