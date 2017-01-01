# usage: CFLAGS=... f=file.* o=file.o sym=symbolname $0 CFLAGS... -> file.o
compile_bin_file() {
    local sec=.rodata
    [ $OS = osx ] && sec="__TEXT,__const"
    # symbols must be prefixed with an underscore on OSX and mingw-32bit
    local sym=$sym; [ $OS = osx -o $P = mingw32 ] && sym=_$sym
    # insert a shim to avoid 'address not in any section file' error in OSX/i386
    local shim; [ $P = osx32 ] && shim=".byte 0"
    echo "\
        .section $sec
        .global $sym
        $sym:
            .int label_2 - label_1
        label_1:
            .incbin \"$f\"
        label_2:
            $shim
    " | gcc -c -xassembler - -o $o $CFLAGS "$@"
}