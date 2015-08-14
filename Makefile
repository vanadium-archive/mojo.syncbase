SHELL := /bin/bash -euo pipefail
PWD := $(shell pwd)
V23_GOPATH := $(shell echo `v23 run env | grep GOPATH | cut -d\= -f2`)
DART_FILES := $(shell find dart/bin dart/lib dart/test -name "*.dart" -not -path "dart/lib/gen/*")
GO_FILES := $(shell find go/src -name "*.go")
V23_GO_FILES := $(shell find $(V23_ROOT) -name "*.go")

# Flags for Syncbase service running as Mojo service.
# See v.io/x/ref/runtime/internal/mojo_util.go for the wonderful magic that
# makes this work.
# NOTE(nlacasse): Switch to --alsologtostderr=true to see syncbased logs in
# mojo_shell stderr.
# TODO(nlacasse): Passing these values in an environment variable won't work on
# Android.  Consider passing these values as url params when loading the
# service.  (Does that work?  Follow up with Mojons.)  Another possilibity is
# to load the values from a configuration file.
SYNCBASED_ADDR := 127.0.0.1:4002
V23_MOJO_FLAGS := --v=5 --alsologtostderr=false --root-dir=/tmp/syncbase_mojo --v23.tcp.address=$(SYNCBASED_ADDR) --v23.permissions.literal={"Admin":{"In":["..."]},"Write":{"In":["..."]},"Read":{"In":["..."]},"Resolve":{"In":["..."]},"Debug":{"In":["..."]}} --v23.credentials=$(V23_ROOT)/experimental/projects/ether/creds

#MOUNTTABLE_ADDR := 127.0.0.1:4001
ifdef MOUNTTABLE_ADDR
	V23_MOJO_FLAGS += --name=syncbase_mojo --v23.namespace.root=/$(MOUNTTABLE_ADDR)
endif

# Wrap the env var value in single quotes. Note, shell parsing works correctly
# because the value itself does not contain single quotes.
V23_MOJO_FLAGS := '$(V23_MOJO_FLAGS)'

ifndef MOJO_DIR
	$(error MOJO_DIR is not set)
endif

ifndef V23_ROOT
	$(error V23_ROOT is not set)
endif

ifdef ANDROID
	# Configure compiler and linker for Android.
	export GOROOT := $(MOJO_DIR)/src/third_party/go/tool/android_arm
	export CGO_ENABLED := 1
	export GOOS := android
	export GOARCH := arm
	export GOARM := 7

	ANDROID_NDK := $(V23_ROOT)/third_party/android/ndk-toolchain

	ifeq ($(wildcard $(ANDROID_NDK)),)
		$(error ERROR: $(ANDROID_NDK) does not exist.  Please install android profile with "v23 profile install android")
	endif

	export CC := $(ANDROID_NDK)/bin/arm-linux-androideabi-gcc
	export CXX := $(ANDROID_NDK)/bin/arm-linux-androideabi-g++

	MOJO_ANDROID_FLAGS := --android
	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/android_Debug
	MOJO_SHARED_LIB := $(PWD)/gen/lib/android/libsystem_thunk.a

	ETHER_BUILD_DIR := $(PWD)/gen/mojo/android

	LEVELDB_OUT_DIR := $(PWD)/gen/lib/android/leveldb
	SNAPPY_OUT_DIR := $(PWD)/gen/lib/android/snappy
else
	# Configure compiler and linker for Linux.
	export GOROOT := $(MOJO_DIR)/src/third_party/go/tool/linux_amd64

	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/Debug
	MOJO_SHARED_LIB := $(PWD)/gen/lib/linux_amd64/libsystem_thunk.a

	ETHER_BUILD_DIR := $(PWD)/gen/mojo/linux_amd64

	LEVELDB_OUT_DIR := $(V23_ROOT)/third_party/cout/linux_amd64/leveldb
	SNAPPY_OUT_DIR := $(V23_ROOT)/third_party/cout/linux_amd64/snappy
endif

GOPATH := $(V23_GOPATH):$(MOJO_DIR):$(MOJO_DIR)/third_party/go:$(MOJO_BUILD_DIR)/gen/go:$(PWD)/gen/go
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

ifeq ($(wildcard $(MOJO_BUILD_DIR)),)
	$(error ERROR: $(MOJO_BUILD_DIR) does not exist.  Please see README.md for instructions on compiling Mojo resources.)
endif

LEVELDB_SRC_DIR := $(V23_ROOT)/third_party/csrc/leveldb
ifeq ($(wildcard $(LEVELDB_SRC_DIR)),)
	$(error ERROR: $(LEVELDB_SRC_DIR) does not exist.  Please install syncbase profile with "v23 profile install syncbase")
endif

SNAPPY_SRC_DIR := $(V23_ROOT)/third_party/csrc/snappy-1.1.2
ifeq ($(wildcard $(SNAPPY_SRC_DIR)),)
	$(error ERROR: $(SNAPPY_SRC_DIR) does not exist.  Please install syncbase profile with "v23 profile install syncbase")
endif

# Compiles a Go program and links against the Mojo C library.
# $1 is input filename.
# $2 is output filename.
define MOGO_BUILD
	mkdir -p $(dir $2)
	GOPATH="$(GOPATH)" \
	CGO_CFLAGS="$(CGO_CFLAGS)" \
	CGO_CXXFLAGS="$(CGO_CXXFLAGS)" \
	CGO_LDFLAGS="$(CGO_LDFLAGS)" \
	$(GOROOT)/bin/go build -o $2 -tags=mojo -ldflags=-shared -buildmode=c-shared $1
	rm $(basename $2).h
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
bin: $(V23_GO_FILES)
	v23 go build -a -o $@/mounttabled v.io/x/ref/services/mounttable/mounttabled
	v23 go build -a -o $@/principal v.io/x/ref/cmd/principal
	v23 go build -a -o $@/syncbased v.io/syncbase/x/ref/services/syncbase/syncbased
	touch $@

# Mints credentials.
creds: bin
	./bin/principal seekblessings --v23.credentials creds
	touch $@

# Builds the library that Mojo services must be linked with.
$(MOJO_SHARED_LIB):
	mkdir -p $(dir $@)
	ar rcs $@ $(MOJO_BUILD_DIR)/obj/mojo/public/platform/native/system.system_thunks.o

ifdef ANDROID
# Builds leveldb library for Android.
$(LEVELDB_OUT_DIR)/lib/libleveldb.a: export TARGET_OS := OS_ANDROID_CROSSCOMPILE
$(LEVELDB_OUT_DIR)/lib/libleveldb.a: export PREFIX := $(LEVELDB_OUT_DIR)/lib
$(LEVELDB_OUT_DIR)/lib/libleveldb.a:
	mkdir -p $(dir $@)
	cd $(LEVELDB_SRC_DIR) && make clean && make all
	# Delete the dynamic libraries, to prevent ld from linking leveldb
	# dynamically.
	rm $(LEVELDB_OUT_DIR)/lib/*.so*

# Builds snappy library for Android.
$(SNAPPY_OUT_DIR)/lib/libsnappy.a:
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
dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart:
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): Figure out why mojom_bindings_generator creates these bad
	# symlinks on dart files.
	rm -f dart/lib/gen/mojom/$(notdir $@)

gen/go/src/mojom/echo/echo.mojom.go: mojom/echo.mojom
gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
gen/go/src/mojom/echo/echo.mojom.go gen/go/src/mojom/syncbase/syncbase.mojom.go:
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

$(ETHER_BUILD_DIR)/echo_server.mojo: $(GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/echo/echo.mojom.go
	$(call MOGO_BUILD,$(PWD)/go/src/echo_server.go,$@)

$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CFLAGS += -I$(LEVELDB_SRC_DIR)/include -I$(SNAPPY_SRC_DIR)/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CXXFLAGS += -I$(LEVELDB_SRC_DIR)/include -I$(SNAPPY_SRC_DIR)/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_LDFLAGS += -lsystem_thunk -L$(LEVELDB_OUT_DIR)/lib -lleveldb -L$(SNAPPY_OUT_DIR)/lib -lsnappy
$(ETHER_BUILD_DIR)/syncbase_server.mojo: $(GO_FILES) $(V23_GO_FILES) $(MOJO_SHARED_LIB) $(LEVELDB_OUT_DIR)/lib/libleveldb.a $(SNAPPY_OUT_DIR)/lib/libsnappy.a gen/go/src/mojom/syncbase/syncbase.mojom.go
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
run-syncbase-example: $(ETHER_BUILD_DIR)/syncbase_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart
	V23_MOJO_FLAGS=$(V23_MOJO_FLAGS) $(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) https://mojo.v.io/syncbase_example.dart

.PHONY: run-echo-example
run-echo-example: $(ETHER_BUILD_DIR)/echo_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) https://mojo.v.io/echo_example.dart

.PHONY: test
test: dart/packages $(ETHER_BUILD_DIR)/echo_server.mojo $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom
	V23_MOJO_FLAGS=$(V23_MOJO_FLAGS) $(MOJO_DIR)/src/mojo/devtools/common/mojo_test $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) --shell-path $(MOJO_DIR)/src/out/Debug/mojo_shell tests

.PHONY: clean
clean:
	rm -rf gen
	rm -rf dart/{lib/gen,packages,.packages,pubspec.lock}
