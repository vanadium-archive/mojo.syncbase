#!/usr/bin/env bash

set -euo pipefail

####################
# Mojo

cd $MOJO_DIR/src
git pull
gclient sync
# Build for desktop.
./mojo/tools/mojob.py gn
./mojo/tools/mojob.py build
# Build for Android.
./mojo/tools/mojob.py gn --android
./mojo/tools/mojob.py build --android

####################
# Sky

cd $SKY_DIR/src
git pull
gclient sync
# Build for desktop.
./sky/tools/gn
ninja -C out/Debug
# Build for Android.
./sky/tools/gn --android
ninja -C out/android_Debug
