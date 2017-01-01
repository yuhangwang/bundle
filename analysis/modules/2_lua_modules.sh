# usage: P=<platform> $0 [dir] -> module1.lua|.dasl ...
# note: skips looking in special dirs.
lua_modules() {
    for f in $1*; do
        if [ -d $f ]; then
            [ "${f:0:1}" != "." \
                -a "${f:0:4}" != csrc \
                -a "${f:0:5}" != media \
                -a "${f:0:5}" != .mgit \
            ] && \
                lua_modules $f/
        else
            lua_module $f
        fi
    done
}
