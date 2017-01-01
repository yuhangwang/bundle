# usage: LDFLAGS=... P=platform ALIBS='lib1 ...' DLIBS='lib1 ...' EXE=exe_file $0
link_linux() {
    verbose g++ $LDFLAGS $OFILES -o "$EXE" \
        -static-libgcc -static-libstdc++ \
        -Wl,-E \
        -Lbin/$P \
        -pthread \
        -Wl,--whole-archive `aopt "$ALIBS"` \
        -Wl,--no-whole-archive `lopt "$DLIBS"` \
        -Wl,-rpath,'\$\$ORIGIN'
    chmod +x "$EXE"
}
