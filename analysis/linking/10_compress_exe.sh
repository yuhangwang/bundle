compress_exe() {
    [ "$COMPRESS_EXE" ] || return
    say "Compressing $EXE..."
    which upx >/dev/null || { say "UPX not found."; return; }
    upx -qqq "$EXE"
}