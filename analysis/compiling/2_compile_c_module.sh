
# usage: CFLAGS=... f=file.c o=file.o $0 CFLAGS... -> file.o
compile_c_module() {
    gcc -c -xc $f -o $o $CFLAGS "$@"
}