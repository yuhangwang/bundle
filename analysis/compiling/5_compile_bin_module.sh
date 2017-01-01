# usage: f=file.* o=file.o $0 CFLAGS... -> file.o
compile_bin_module() {
    local sym=${f//[\-\.\/\\]/_}  # foo/bar-baz.ext -> foo_bar_baz_ext
    sym=$BBIN_PREFIX$sym compile_bin_file "$@"
}