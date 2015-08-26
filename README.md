# Ether

This project exposes Syncbase as a Mojo service.

Read the [architecture proposal].

## Initial Mojo setup

You must have the Mojo repo in `$MOJO_DIR`.

This section only needs to be run once.

See the [Mojo readme] for more comprehensive instructions.

### Install Mojo prereqs

1. Install [depot tools].
2. Install [Goma][goma].
3. Put the following in your `.bashrc`:

       # NOTE: Actual locations depend on where you installed depot_tools and
       # goma.
       export PATH=${PATH}:${HOME}/dev/depot_tools
       export GOMA_DIR=${HOME}/goma
       export MOJO_DIR=${HOME}/mojo

### Download Mojo repo

    $ mkdir $MOJO_DIR && cd $MOJO_DIR

    # NOTE: This step takes about 10 min.
    $ fetch mojo --target_os=android,linux

    # NOTE: This step also takes about 10 min.  Furthermore, the script uses
    # 'sudo', so you will need to enter your password.
    $ cd src && ./build/install-build-deps.sh

    # Or, to include Android deps as well:
    $ cd src && ./build/install-build-deps-android.sh

## Update Mojo and compile resources

This updates the Mojo repo to HEAD, and builds the Mojo resources needed to
compile Ether.

Run this while you grab your morning coffee.

1. Start by updating the repo.

       $ cd $MOJO_DIR/src
       $ git checkout master
       $ git pull
       $ gclient sync

2. Compile for Linux.  Built resources will be in `$MOJO_DIR/src/out/Debug`

       $ ./mojo/tools/mojob.py gn
       $ ./mojo/tools/mojob.py build # NOTE: This can take up to 10 minutes.

3. Compile for Android.  Built resources will be in
   `$MOJO_DIR/src/out/android_Debug`

       $ ./mojo/tools/mojob.py gn --android
       $ ./mojo/tools/mojob.py build --android # NOTE: This can take up to 10 minutes.

## Sky setup

You must have the Sky code in `$SKY_DIR`. Follow the instructions in the Sky
[CONTRIBUTING.md][sky contrib] file for "Getting the code" and "Building the
code".

Also, you must patch your Mojo code (and rebuild Mojo):
https://github.com/domokit/mojo/issues/370

## Install Dart SDK

To run Dart apps, you must install the Dart SDK.

Googlers: http://go/install-dart
External: https://www.dartlang.org/downloads/

## Testing

Run the tests:

    make test

This will run all tests listed in the `tests` file in the root directory of
this repo.

The following command will run a single test file.  This is useful when the
full test suite hangs with no output.

    $(MOJO_DIR)/src/mojo/devtools/common/mojo_run -v --enable-multiprocess --shell-path $(MOJO_DIR)/src/out/Debug/mojo_shell dart/test/<filename>

[architecture proposal]: https://docs.google.com/document/d/1TyxPYIhj9VBCtY7eAXu_MEV9y0dtRx7n7UY4jm76Qq4/edit
[depot tools]: http://www.chromium.org/developers/how-tos/install-depot-tools
[goma]: https://sites.google.com/a/google.com/goma/how-to-use-goma/how-to-use-goma-for-chrome-team
[mojo readme]: https://github.com/domokit/mojo/blob/master/README.md
[sky contrib]: https://github.com/domokit/sky_engine/blob/master/CONTRIBUTING.md
