#!/usr/bin/env bash
# Upload the compiled ulisp interpreter
# (NOTE you only need to do this once, after that simply press the 'reset' button on the micro:bit when you want a clean slate)
# 
#
# after a lot of experimentation, I was able get openocd to work with 32bit arch (glibc_multi)
# (TODO: we can probably do some tricks in the shell.nix file to make this more neat)
GLIBC_MULTI_PATH=$(nix-build --no-out-link -A glibc_multi '<nixpkgs>')
echo $GLIBC_MULTI_PATH
LD_LIBRARY_PATH="$GLIBC_MULTI_PATH/lib32" openocd -f bbc_microbit_v2.cfg -c "init; halt; program $(pwd)/ulisp.ino.hex verify reset"
