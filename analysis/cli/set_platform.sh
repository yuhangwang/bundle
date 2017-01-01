# usage: $0 [force_32bit]
set_platform() {

    # detect platform
    P=`.mgit/platform.sh`
    [ "$P" ] || die "Unable to set platform."
    [ "$1" ] && P=${P/64/32}

    # set platform-specific variables
    OS=${P%[0-9][0-9]}
    [ "$DLIBS" ]   || eval DLIBS=\$DLIBS_$OS
    [ "$APREFIX" ] || eval APREFIX=\$APREFIX_$OS
    [ "$ICON" ]    || eval ICON=\$ICON_$OS

    [ $P = osx32 ] && { CFLAGS="-arch i386";   LDFLAGS="-arch i386"; }
    [ $P = osx64 ] && { CFLAGS="-arch x86_64"; LDFLAGS="-arch x86_64"; }
}