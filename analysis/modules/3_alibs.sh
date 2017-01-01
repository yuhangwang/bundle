# usage: P=<platform> $0 -> lib1 ...
alibs() {
    (cd bin/$P &&
        for f in *.a; do
            local m=${f%*.*}   # libz.* -> libz
            echo ${m#$APREFIX} # libz -> z
        done)
}
