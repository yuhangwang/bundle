
usage() {
    echo
    describe
    echo
    echo " USAGE: mgit bundle options..."
    echo
    echo "  -o  --output FILE                  Output executable (required)"
    echo
    echo "  -m  --modules \"FILE1 ...\"|--all|-- Lua (or other) modules to bundle [1]"
    echo "  -a  --alibs \"LIB1 ...\"|--all|--    Static libs to bundle            [2]"
    echo "  -d  --dlibs \"LIB1 ...\"|--          Dynamic libs to link against     [3]"
    echo "  -f  --frameworks \"FRM1 ...\"        Frameworks to link against (OSX) [4]"
    echo "  -b  --bin-modules \"FILE1 ...\"      Files to force-bundle as binary blobs"
    echo
    echo "  -M  --main MODULE                  Module to run on start-up"
    echo
    echo "  -m32                               Compile for 32bit (OSX)"
    echo "  -z  --compress                     Compress the executable (needs UPX)"
    echo "  -w  --no-console                   Hide console (Windows)"
    echo "  -w  --no-console                   Make app bundle (OSX)"
    echo "  -i  --icon FILE.ico                Set icon (Windows)"
    echo "  -i  --icon FILE.png                Set icon (OSX; requires -w)"
    echo
    echo "  -ll --list-lua-modules             List Lua modules"
    echo "  -la --list-alibs                   List static libs (.a files)"
    echo
    echo "  -C  --clean                        Ignore the object cache"
    echo
    echo "  -v  --verbose                      Be verbose"
    echo "  -h  --help                         Show this screen"
    echo
   echo " Passing -- clears the list of args for that option, including implicit args."
    echo
    echo " [1] .lua, .c and .dasl are compiled, other files are added as blobs."
    echo
    echo " [2] implicit static libs:           "$ALIBS0
    echo " [3] implicit dynamic libs:          "$DLIBS0
    echo " [4] implicit frameworks:            "$FRAMEWORKS0
    echo
    exit
}