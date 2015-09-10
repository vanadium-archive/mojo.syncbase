#!/usr/bin/env bash
# Copyright 2015 The Vanadium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -euo pipefail

DESKTOP="${DESKTOP:-1}"
ANDROID="${ANDROID:-1}"

####################
# Mojo

cd $MOJO_DIR/src
git pull
gclient sync
if [[ "${DESKTOP}" = "1" ]]; then
  ./mojo/tools/mojob.py gn
  ./mojo/tools/mojob.py build
fi
if [[ "${ANDROID}" = "1" ]]; then
  ./mojo/tools/mojob.py gn --android
  ./mojo/tools/mojob.py build --android
fi

####################
# Sky

cd $SKY_DIR/src
git pull
gclient sync
if [[ "${DESKTOP}" = "1" ]]; then
  ./sky/tools/gn
  ninja -C out/Debug
fi
if [[ "${ANDROID}" = "1" ]]; then
  ./sky/tools/gn --android
  ninja -C out/android_Debug
fi
