parse_opts() {
    while [ "$1" ]; do
        local opt="$1"; shift
        case "$opt" in
            -o  | --output)
                EXE="$1"; shift;;
            -m  | --modules)
                [ "$1" = -- ] && MODULES= || \
                    [ "$1" = --all ] && MODULES="$(lua_modules)" || \
                    MODULES="$MODULES $1"
                shift
                ;;
            -b | --bin-modules)
                BIN_MODULES="$BIN_MODULES $1"; shift;;
            -M  | --main)
                MAIN="$1"; shift;;
            -a  | --alibs)
                [ "$1" = -- ] && ALIBS= || \
                    [ "$1" = --all ] && ALIBS="$(alibs)" || \
                        ALIBS="$ALIBS $1"
                shift
                ;;
            -d  | --dlibs)
                [ "$1" = -- ] && DLIBS= || DLIBS="$DLIBS $1"
                shift
                ;;
            -f  | --frameworks)
                [ "$1" = -- ] && FRAMEWORKS= || FRAMEWORKS="$FRAMEWORKS $1"
                shift
                ;;
            -ll | --list-lua-modules)
                lua_modules; exit;;
            -la | --list-alibs)
                alibs; exit;;
            -C  | --clean)
                IGNORE_ODIR=1;;
            -m32)
                set_platform m32;;
            -z  | --compress)
                COMPRESS_EXE=1;;
            -i  | --icon)
                ICON="$1"; shift;;
            -w  | --no-console)
                NOCONSOLE=1;;
            -h  | --help)
                usage;;
            -v | --verbose)
                VERBOSE=1;;
            *)
                echo "Invalid option: $opt"
                usage "$opt"
                ;;
        esac
    done
    [ "$EXE" ] || usage
}