SHELL := /bin/bash -euo pipefail
PWD := $(shell pwd)
V23_GOPATH := $(shell echo `v23 run env | grep GOPATH | cut -d\= -f2`)
DART_FILES := $(shell find dart/bin dart/lib dart/test -name "*.dart" -not -path "dart/lib/gen/*")
GO_FILES := $(shell find go/src -name "*.go")
V23_GO_FILES := $(shell find $(V23_ROOT) -name "*.go")

# Flags for Syncbase service running as Mojo service.
# See v.io/x/ref/runtime/internal/mojo_util.go for the wonderful magic that
# makes this work.
SYNCBASED_ADDR := 127.0.0.1:4002
V23_MOJO_FLAGS := --v=5 --root-dir=/tmp/syncbase_mojo --v23.tcp.address=$(SYNCBASED_ADDR) --v23.permissions.literal={\"Admin\":{\"In\":[\"...\"]},\"Write\":{\"In\":[\"...\"]},\"Read\":{\"In\":[\"...\"]},\"Resolve\":{\"In\":[\"...\"]},\"Debug\":{\"In\":[\"...\"]}}

#MOUNTTABLE_ADDR := 127.0.0.1:4001
ifdef MOUNTTABLE_ADDR
	V23_MOJO_FLAGS += --name=syncbase_mojo --v23.namespace.root=/$(MOUNTTABLE_ADDR)
endif

GO_BUILD_TAGS := mojo

ifdef ANDROID
	# Configure compiler and linker for Android.
	export GOROOT := $(MOJO_DIR)/src/third_party/go/tool/android_arm
	export CGO_ENABLED := 1
	export GOOS := android
	export GOARCH := arm
	export GOARM := 7
	GO_BUILD_TAGS += android

	ANDROID_NDK := $(V23_ROOT)/third_party/android/ndk-toolchain

	export CC := $(ANDROID_NDK)/bin/arm-linux-androideabi-gcc
	export CXX := $(ANDROID_NDK)/bin/arm-linux-androideabi-g++

	MOJO_ANDROID_FLAGS := --android
	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/android_Debug
	MOJO_SHARED_LIB := $(PWD)/gen/lib/android/libsystem_thunk.a
	MOJO_SHELL_PATH := $(MOJO_BUILD_DIR)/apks/MojoShell.apk

	ETHER_BUILD_DIR := $(PWD)/gen/mojo/android

	LEVELDB_OUT_DIR := $(PWD)/gen/lib/android/leveldb
	SNAPPY_OUT_DIR := $(PWD)/gen/lib/android/snappy

	# NOTE(nlacasse): Trying to write to a directory that the app does not have
	# permission to causes a crash with no stack trace.  Because of this, we
	# set logtostderr=true to prevent vlog from writing logs to directories we
	# don't have permissions on.  (Alternatively, we could set --log_dir to a
	# directory inside APP_HOME_DIR.)  We set syncbase root-dir inside
	# APP_HOME_DIR for the same reason.
	APP_HOME_DIR = /data/data/org.chromium.mojo.shell/app_home
	V23_MOJO_FLAGS += --logtostderr=true --root-dir=$(APP_HOME_DIR)/syncbase_data
else
	# Configure compiler and linker for Linux.
	export GOROOT := $(MOJO_DIR)/src/third_party/go/tool/linux_amd64

	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/Debug
	MOJO_SHARED_LIB := $(PWD)/gen/lib/linux_amd64/libsystem_thunk.a
	MOJO_SHELL_PATH := $(MOJO_BUILD_DIR)/mojo_shell

	ETHER_BUILD_DIR := $(PWD)/gen/mojo/linux_amd64

	LEVELDB_OUT_DIR := $(V23_ROOT)/third_party/cout/linux_amd64/leveldb
	SNAPPY_OUT_DIR := $(V23_ROOT)/third_party/cout/linux_amd64/snappy

	V23_MOJO_FLAGS += --root-dir=/tmp/syncbase_data
endif

GOPATH := $(V23_GOPATH):$(MOJO_DIR):$(MOJO_DIR)/third_party/go:$(MOJO_BUILD_DIR)/gen/go:$(PWD)/go:$(PWD)/gen/go
CGO_CFLAGS := -I$(MOJO_DIR)/src
CGO_CXXFLAGS := -I$(MOJO_DIR)/src
CGO_LDFLAGS := -L$(dir $(MOJO_SHARED_LIB)) -lsystem_thunk

# NOTE(nlacasse): Running Go Mojo services requires passing the
# --enable-multiprocess flag to mojo_shell.  This is because the Go runtime is
# very large, and can interfere with C++ memory if they are in the same
# process.
MOJO_SHELL_FLAGS := -v --enable-multiprocess \
	--config-file $(PWD)/mojoconfig \
	--config-alias ETHER_DIR=$(PWD) \
	--config-alias ETHER_BUILD_DIR=$(ETHER_BUILD_DIR)

LEVELDB_SRC_DIR := $(V23_ROOT)/third_party/csrc/leveldb
SNAPPY_SRC_DIR := $(V23_ROOT)/third_party/csrc/snappy-1.1.2

LDFLAGS := -shared

# Compiles a Go program and links against the Mojo C library.
# $1 is input filename.
# $2 is output filename.
define MOGO_BUILD
	mkdir -p $(dir $2)
	GOPATH="$(GOPATH)" \
	CGO_CFLAGS="$(CGO_CFLAGS)" \
	CGO_CXXFLAGS="$(CGO_CXXFLAGS)" \
	CGO_LDFLAGS="$(CGO_LDFLAGS)" \
	$(GOROOT)/bin/go build -o $2 -tags="$(GO_BUILD_TAGS)" -ldflags="$(LDFLAGS)" -buildmode=c-shared $1
	rm -f $(basename $2).h
endef

# Generates go bindings from .mojom file.
# $1 is input filename.
# $2 is output directory.
# $3 is language (go, dart, ...).
define MOJOM_GEN
	mkdir -p $2
	$(MOJO_DIR)/src/mojo/public/tools/bindings/mojom_bindings_generator.py $1 -d . -o $2 -g $3
endef

.DELETE_ON_ERROR:

all: test

# Builds mounttabled, principal, and syncbased.
bin: $(V23_GO_FILES) | env-check
	v23 go build -a -o $@/mounttabled v.io/x/ref/services/mounttable/mounttabled
	v23 go build -a -o $@/principal v.io/x/ref/cmd/principal
	v23 go build -a -o $@/syncbased v.io/syncbase/x/ref/services/syncbase/syncbased
	touch $@

# Mints credentials.
creds: bin
	./bin/principal seekblessings --v23.credentials creds
	touch $@

# Builds the library that Mojo services must be linked with.
$(MOJO_SHARED_LIB): | env-check
	mkdir -p $(dir $@)
	ar rcs $@ $(MOJO_BUILD_DIR)/obj/mojo/public/platform/native/system.system_thunks.o

ifdef ANDROID
# Builds leveldb library for Android.
$(LEVELDB_OUT_DIR)/lib/libleveldb.a: export TARGET_OS := OS_ANDROID_CROSSCOMPILE
$(LEVELDB_OUT_DIR)/lib/libleveldb.a: export PREFIX := $(LEVELDB_OUT_DIR)/lib
$(LEVELDB_OUT_DIR)/lib/libleveldb.a: | env-check
	mkdir -p $(dir $@)
	cd $(LEVELDB_SRC_DIR) && make clean && make all
	# Delete the dynamic libraries, to prevent ld from linking leveldb
	# dynamically.
	rm $(LEVELDB_OUT_DIR)/lib/*.so*

# Builds snappy library for Android.
$(SNAPPY_OUT_DIR)/lib/libsnappy.a: | env-check
	mkdir -p $(dir $@)
	cd $(SNAPPY_SRC_DIR) && make clean && ./configure --prefix=$(SNAPPY_OUT_DIR) --build=x86_64-unknown-linux-gnu --host=arm-linux-androideabi --target=arm-linux-androideabi && make install
	# Delete the dynamic libraries, to prevent ld from linking snappy
	# dynamically.
	rm $(SNAPPY_OUT_DIR)/lib/*.so*
endif

.PHONY: gen-mojom
# TODO(nlacasse): The echo_client and echo_server are currently used to test
# compilation and mojom binding generation.  We should remove them once they
# are no longer needed.
gen-mojom: dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart gen/go/src/mojom/echo/echo.mojom.go
gen-mojom: dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/syncbase/syncbase.mojom.go

dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart: mojom/echo.mojom
dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom
dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: | env-check
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): Figure out why mojom_bindings_generator creates these bad
	# symlinks on dart files.
	rm -f dart/lib/gen/mojom/$(notdir $@)

gen/go/src/mojom/echo/echo.mojom.go: mojom/echo.mojom
gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
gen/go/src/mojom/echo/echo.mojom.go gen/go/src/mojom/syncbase/syncbase.mojom.go: | env-check
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

$(ETHER_BUILD_DIR)/echo_server.mojo: $(GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/echo/echo.mojom.go | env-check
	$(call MOGO_BUILD,$(PWD)/go/src/echo_server.go,$@)

# TODO(nlacasse): These target-specific variables will affect this task and all
# pre-requisite tasks.  Luckily none of the prerequisites require that these
# variables have their original value, so everything works.  Once we have a
# prereq that requires the original value, we will need to re-work these
# variables.
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CFLAGS += -I$(LEVELDB_SRC_DIR)/include -I$(SNAPPY_SRC_DIR)/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CXXFLAGS += -I$(LEVELDB_SRC_DIR)/include -I$(SNAPPY_SRC_DIR)/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_LDFLAGS += -lsystem_thunk -L$(LEVELDB_OUT_DIR)/lib -lleveldb -L$(SNAPPY_OUT_DIR)/lib -lsnappy
$(ETHER_BUILD_DIR)/syncbase_server.mojo: LDFLAGS += -X v.io/x/ref/runtime/internal.commandLineFlags '$(V23_MOJO_FLAGS)'
$(ETHER_BUILD_DIR)/syncbase_server.mojo: $(GO_FILES) $(V23_GO_FILES) $(MOJO_SHARED_LIB) $(LEVELDB_OUT_DIR)/lib/libleveldb.a $(SNAPPY_OUT_DIR)/lib/libsnappy.a gen/go/src/mojom/syncbase/syncbase.mojom.go | env-check
	$(call MOGO_BUILD,v.io/syncbase/x/ref/services/syncbase/syncbased,$@)

# Formats dart files to follow dart style conventions.
.PHONY: dartfmt
dartfmt:
	dartfmt --overwrite $(DART_FILES)

# Lints src and test files with dartanalyzer. This takes a few seconds.
.PHONY: dartanalyzer
dartanalyzer: dart/packages gen-mojom
	# TODO(nlacasse): Fix dart mojom binding generator so it does not produce
	# files that violate dartanalyzer.  For now, we use "grep -v" to hide all
	# warnings from *.mojom.dart files.
	cd dart && dartanalyzer bin/*.dart lib/*.dart test/*.dart | grep -v '\.mojom\.dart'

# Installs dart dependencies.
dart/packages: dart/pubspec.yaml
	cd dart && pub get

.PHONY: run-syncbase-example
run-syncbase-example: $(ETHER_BUILD_DIR)/syncbase_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart | env-check
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) https://mojo.v.io/syncbase_example.dart

.PHONY: run-echo-example
run-echo-example: $(ETHER_BUILD_DIR)/echo_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart | env-check
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) https://mojo.v.io/echo_example.dart

# TODO(nlacasse): The tests are currently flaky due to
# https://github.com/domokit/mojo/issues/387.  If you see errors about
# "!consumer_in_two_phase_read()", ignore and re-run the tests.
.PHONY: test
test: dart/packages $(ETHER_BUILD_DIR)/echo_server.mojo $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom | env-check
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_test $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) --shell-path $(MOJO_SHELL_PATH) tests

.PHONY: env-check
env-check:
ifndef MOJO_DIR
	$(error MOJO_DIR is not set)
endif
ifndef V23_ROOT
	$(error V23_ROOT is not set)
endif
ifeq ($(wildcard $(MOJO_BUILD_DIR)),)
	$(error ERROR: $(MOJO_BUILD_DIR) does not exist.  Please see README.md for instructions on compiling Mojo resources.)
endif
ifdef ANDROID
ifeq ($(wildcard $(ANDROID_NDK)),)
	$(error ERROR: $(ANDROID_NDK) does not exist.  Please install android profile with "v23 profile install android")
endif
ifeq ($(wildcard $(LEVELDB_SRC_DIR)),)
	$(error ERROR: $(LEVELDB_SRC_DIR) does not exist.  Please install syncbase profile with "v23 profile install syncbase")
endif
ifeq ($(wildcard $(SNAPPY_SRC_DIR)),)
	$(error ERROR: $(SNAPPY_SRC_DIR) does not exist.  Please install syncbase profile with "v23 profile install syncbase")
endif
endif

.PHONY: clean
clean:
	rm -rf gen/mojo gen/go

.PHONY: veryclean
veryclean:
	rm -rf gen
	rm -rf dart/{lib/gen,packages,.packages,pubspec.lock}
