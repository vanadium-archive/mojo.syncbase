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
# If needed, git checkout at a specific commit as follows.
# git fetch
# git checkout -f f871196158df873c7ff8498225bd011e0148174e
gclient sync
if [[ "${DESKTOP}" = "1" ]]; then
  ./mojo/tools/mojob.py gn
  ./mojo/tools/mojob.py build
fi
if [[ "${ANDROID}" = "1" ]]; then
  ./mojo/tools/mojob.py gn --android
  ./mojo/tools/mojob.py build --android
fi
