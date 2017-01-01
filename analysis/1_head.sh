#!/bin/bash
shopt -s nullglob

describe() {
    echo " Compile and link together LuaJIT, Lua modules, Lua/C modules, C libraries,"
    echo " and other static assets into a single fat executable."
    echo
    echo " Tested with mingw, gcc and clang on Windows, Linux and OSX respectively."
    echo " Written by Cosmin Apreutesei. Public Domain."
}

say() { [ "$VERBOSE" ] && echo "$@"; }
verbose() { say "$@"; "$@"; }
die() { echo "$@" >&2; exit 1; }
