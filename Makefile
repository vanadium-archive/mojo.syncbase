SHELL := /bin/bash -euo pipefail
PWD := $(shell pwd)
V23_GOPATH := $(shell echo `v23 run env | grep GOPATH | cut -d\= -f2`)
DART_FILES := $(shell find dart/bin dart/lib dart/test -name "*.dart" -not -path "dart/lib/gen/*")
GO_FILES := $(shell find go/src -name "*.go")
V23_GO_FILES := $(shell find $(V23_ROOT) -name "*.go")

# Flags for Syncbase service running as Mojo service.
# See v.io/x/ref/runtime/internal/mojo_util.go for the wonderful magic that
# makes this work.
MOUNTTABLE_ADDR := 127.0.0.1:4001
SYNCBASED_ADDR := 127.0.0.1:4002
V23_MOJO_FLAGS := '--v=5 --alsologtostderr=false --root-dir=/tmp/syncbase_mojo --name=syncbase_mojo --v23.namespace.root=/$(MOUNTTABLE_ADDR) --v23.tcp.address=$(SYNCBASED_ADDR) --v23.permissions.literal={"Admin":{"In":["..."]},"Write":{"In":["..."]},"Read":{"In":["..."]},"Resolve":{"In":["..."]},"Debug":{"In":["..."]}} --v23.credentials=$(V23_ROOT)/experimental/projects/ether/creds'

ifndef MOJO_DIR
	$(error MOJO_DIR is not set: $(MOJO_DIR))
endif

ifdef ANDROID
	# TODO(nlacasse): Serve mojo resources over HTTP so they are accessible to
	# Android.  Currently everything is served off the local filesystem, which
	# will not work on Android.  Until then, Android support is disabled.
	$(error Android is currently not supported.)

	# Configure compiler and linker for Android.
	GO_BIN := $(MOJO_DIR)/src/third_party/go/tool/android_arm/bin/go
	GO_FLAGS := -tags=mojo -ldflags=-shared
	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/android_Debug
	MOJO_FLAGS := --android
	MOJO_SHARED_LIB := $(PWD)/gen/lib/android/libsystem_thunk.a
else
	# Configure compiler and linker for Linux.
	GO_BIN := $(MOJO_DIR)/src/third_party/go/tool/linux_amd64/bin/go
	GO_FLAGS := -tags=mojo -ldflags=-shared -buildmode=c-shared
	MOJO_FLAGS :=
	MOJO_BUILD_DIR := $(MOJO_DIR)/src/out/Debug
	MOJO_SHARED_LIB := $(PWD)/gen/lib/linux_amd64/libsystem_thunk.a
endif

# Compiles a Go program and links against the Mojo C shared library.
# $1 is input filename.
# $2 is output filename.
# See $(MOJO_DIR)/mojo/go/go.py for description of arguments to go.py (aka
# MOGO_BIN).
#
# MOJO_GOPATH must be exported so it can be picked up by MOGO_BIN.
export MOJO_GOPATH := $(V23_GOPATH):$(PWD)/gen/go:$(PWD)/go:$(MOJO_BUILD_DIR)/gen/go
MOGO_BIN := $(MOJO_DIR)/src/mojo/go/go.py
define MOGO_BUILD
	mkdir -p $(dir $2)
	$(MOGO_BIN) $(MOJO_FLAGS) -- \
		$(GO_BIN) \
		$(shell mktemp -d) \
		$(PWD)/$(2) \
		$(MOJO_DIR)/src \
		$(PWD)/gen \
		"-I$(MOJO_DIR)/src" \
		"-L$(dir $(MOJO_SHARED_LIB)) -lsystem_thunk" \
		build $(GO_FLAGS) $1
endef

# Generates go bindings from .mojom file.
# $1 is input filename.
# $2 is output directory.
# $3 is language (go, dart, ...).
MOJOM_BIN := $(MOJO_DIR)/src/mojo/public/tools/bindings/mojom_bindings_generator.py
define MOJOM_GEN
	mkdir -p $2
	$(MOJOM_BIN) $1 -d . -o $2 -g $3
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

# Builds the shared library that Mojo services must be linked with.
$(MOJO_SHARED_LIB):
ifeq ($(wildcard $(MOJO_BUILD_DIR)),)
	$(error ERROR: $(MOJO_BUILD_DIR) does not exist.  Please see README.md for instructions on compiling Mojo resources.)
endif
	mkdir -p $(dir $@)
	ar rcs $@ $(MOJO_BUILD_DIR)/obj/mojo/public/platform/native/system.system_thunks.o

.PHONY: gen-mojom
# TODO(nlacasse): The echo_client and echo_server are currently used to test
# compilation and mojom binding generation.  We should remove them once they
# are no longer needed.
gen-mojom: dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart gen/go/src/mojom/echo/echo.mojom.go
gen-mojom: dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/syncbase/syncbase.mojom.go

dart/lib/gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart: mojom/echo.mojom
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): Figure out why mojom_bindings_generator creates these bad
	# symlinks on dart files.
	rm -f dart/lib/gen/mojom/echo.mojom.dart

dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): Figure out why mojom_bindings_generator creates these bad
	# symlinks on dart files.
	rm -f dart/lib/gen/mojom/syncbase.mojom.dart

gen/go/src/mojom/echo/echo.mojom.go: mojom/echo.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

gen/mojo/echo_server.mojo: $(GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/echo/echo.mojom.go
	$(call MOGO_BUILD,$(PWD)/go/src/echo_server.go,$@)

gen/mojo/syncbase_server.mojo: $(GO_FILES) $(V23_GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/syncbase/syncbase.mojom.go
	$(call MOGO_BUILD,v.io/syncbase/x/ref/services/syncbase/syncbased,$@)

# Formats dart files to follow dart style conventions.
.PHONY: dartfmt
dartfmt:
	dartfmt --overwrite --line-length 120 $(DART_FILES)

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

# TODO(nlacasse): Remove this task and dart/bin/syncbase.dart when the tests
# are stable enough to reliably test syncbase.
.PHONY: run-syncbase-app
run-syncbase-app: gen/mojo/syncbase_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart
	V23_MOJO_FLAGS=$(V23_MOJO_FLAGS) $(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_FLAGS) -v --enable-multiprocess $(PWD)/dart/bin/syncbase.dart

.PHONY: test
test: dart/packages gen/mojo/echo_server.mojo gen-mojom
	# TODO(nlacasse): These tests sometimes hang.  I suspect some connection is
	# not getting closed properly.  More debugging is necessary.
	# TODO(nlacasse): We should be passing "--enable-multiprocess" here, since
	# that is usually needed for Go Mojo services.  However, using that flag
	# causes the test runner to crash on exit with "Connection error to the
	# shell".  The tests somehow run and pass without that flag, so maybe it's
	# not necessary?
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_test $(MOJO_FLAGS) -v --shell-path $(MOJO_DIR)/src/out/Debug/mojo_shell tests

.PHONY: clean
clean:
	rm -rf gen
	rm -rf dart/{lib/gen,packages,.packages,pubspec.lock}
