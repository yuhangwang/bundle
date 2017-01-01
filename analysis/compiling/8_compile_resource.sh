# usage: o=file.o s="res code..." $0
compile_resource() {
    OFILES="$OFILES $o"
    echo "$s" | windres -o $o
}