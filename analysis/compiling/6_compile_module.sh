# usage: mtype=type osuffix=suffix $0 file[.lua]|.c|.dasl|.* CFLAGS... -> file.o
compile_module() {
    local f=$1; shift

    # disambiguate between file `a.b` and Lua module `a.b`.
    [ -f $f ] || {
        local luaf=${f//\./\/}    # a.b -> a/b
        luaf=$luaf.lua            # a/b -> a/b.lua
        [ -f $luaf ] || die "File not found: $f (nor $luaf)"
        f=$luaf
    }

    # infer file type from file extension
    local x=${f##*.}             # a.ext -> ext
    [ $x = c -o $x = lua -o $x = dasl ] || x=bin
    [ "$mtype" ] && x=$mtype

    local o=$ODIR/$f$osuffix.o   # a.ext -> $ODIR/a.ext.o

    # add the .o file to the list of files to be linked
    OFILES="$OFILES $o"

    # use the cached .o file if the source file hasn't changed, make-style.
    [ -z "$IGNORE_ODIR" -a -f $o -a $o -nt $f ] && return

    # or, compile the source file into the .o file
    sayt $x $f
    mkdir -p `dirname $o`
    f=$f o=$o compile_${x}_module "$@"
}