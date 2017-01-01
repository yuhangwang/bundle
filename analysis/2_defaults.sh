
# defaults -------------------------------------------------------------------

BLUA_PREFIX=Blua_
BBIN_PREFIX=Bbin_

# note: only the mingw linker is smart to ommit dlibs that are not used.
DLIBS_mingw="gdi32 msimg32 opengl32 winmm ws2_32"
DLIBS_linux="m dl"
DLIBS_osx=
FRAMEWORKS="ApplicationServices" # for OSX

APREFIX_mingw=
APREFIX_linux=lib
APREFIX_osx=lib

ALIBS="luajit"
MODULES="bundle_loader"
BIN_MODULES=
ICON_mingw=csrc/bundle/luapower.ico
ICON_osx=csrc/bundle/luapower-icon.png
OSX_ICON_SIZES="16 32 128" # you can add 256 and 512 but the icns will be 0.5M

IGNORE_ODIR=
COMPRESS_EXE=
NOCONSOLE=
VERBOSE=