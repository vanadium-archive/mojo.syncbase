SHELL := /bin/bash -euo pipefail
PWD := $(shell pwd)
V23_GOPATH := $(shell echo `v23 run env | grep GOPATH | cut -d\= -f2`)
DART_FILES := $(shell find $(PWD)/dart -name *.dart ! -name *.part.dart)
GO_FILES := $(shell find go/src -name "*.go")
V23_GO_FILES := $(shell find $(V23_ROOT) -name "*.go")

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

all: run-echo-app

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
gen-mojom: gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart gen/go/src/mojom/echo/echo.mojom.go
gen-mojom: gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/syncbase/syncbase.mojom.go

gen/dart-pkg/mojom/lib/mojo/echo.mojom.dart: mojom/echo.mojom
	$(call MOJOM_GEN,$<,gen,dart)

gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,gen,dart)

gen/go/src/mojom/echo/echo.mojom.go: mojom/echo.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

gen/mojo/echo_server.mojo: $(GO_FILES) gen-mojom $(MOJO_SHARED_LIB)
	$(call MOGO_BUILD,$(PWD)/go/src/echo_server.go,$@)

gen/mojo/syncbase_server.mojo: $(GO_FILES) $(V23_GO_FILES) gen-mojom $(MOJO_SHARED_LIB)
	$(call MOGO_BUILD,v.io/syncbase/x/ref/services/syncbase/syncbased,$@)

# Check that the dart-style is being met. Note: Comments are ignored when
# checking whitespace.
.PHONY: check-fmt
check-fmt:
	dartfmt -n $(DART_FILES)

# Lint src and test files with dartanalyzer. This takes a few seconds.
.PHONY: dartanalyzer
dartanalyzer: dart/packages gen-mojom
	cd dart && dartanalyzer $(DART_FILES)

# Installs dart dependencies.
dart/packages: dart/pubspec.yaml
	cd dart && pub get

.PHONY: run-echo-app
run-echo-app: gen/mojo/echo_server.mojo gen-mojom dart/packages
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_FLAGS) -v --enable-multiprocess $(PWD)/dart/bin/echo_client.dart

.PHONY: run-syncbase-app
run-syncbase-app: gen/mojo/syncbase_server.mojo gen-mojom dart/packages
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run $(MOJO_FLAGS) -v --enable-multiprocess $(PWD)/dart/bin/syncbase_client.dart

# TODO(nlacasse): This should run real tests once we have them.
.PHONY: test
test: dartanalyzer

.PHONY: clean
clean:
	rm -rf gen
	rm -rf dart/{packages,.packages,pubspec.lock}
