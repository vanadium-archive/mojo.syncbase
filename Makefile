PWD=$(shell pwd)
V23_GOPATH=$(shell echo `v23 run env | grep GOPATH | cut -d\= -f2`)

ifndef MOJO_DIR
	$(error MOJO_DIR is not set: ${MOJO_DIR})
endif

ifdef ANDROID
	# Configure compiler and linker for Android.
	GO_BIN=$(MOJO_DIR)/src/third_party/go/tool/android_arm/bin/go
	GO_FLAGS=-ldflags=-shared
	MOJO_BUILD_DIR=$(MOJO_DIR)/src/out/android_Debug
	MOJO_FLAGS=--android
	MOJO_SHARED_LIB=$(PWD)/gen/lib/android/libsystem_thunk.a
else
	# Configure compiler and linker for Linux.
	GO_BIN=$(MOJO_DIR)/src/third_party/go/tool/linux_amd64/bin/go
	GO_FLAGS=-ldflags=-shared -buildmode=c-shared
	MOJO_FLAGS=
	MOJO_BUILD_DIR=$(MOJO_DIR)/src/out/Debug
	MOJO_SHARED_LIB=$(PWD)/gen/lib/linux_amd64/libsystem_thunk.a
endif

# Compiles a Go program and links against the Mojo C shared library.
# $1 is input filename.
# $2 is output filename.
# See $(MOJO_DIR)/mojo/go/go.py for description of arguments to go.py (aka
# MOGO_BIN).
#
# MOJO_GOPATH must be exported so it can be picked up by MOGO_BIN.
#
# TODO(nlacasse): Add make task to build syncbase service using this MOGO_BUILD
# function.
export MOJO_GOPATH=$(V23_GOPATH):$(PWD)/gen/go:$(PWD)/go:$(MOJO_BUILD_DIR)/gen/go
MOGO_BIN=$(MOJO_DIR)/src/mojo/go/go.py
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
		build $(GO_FLAGS) $(PWD)/$1
endef

# Generates go bindings from .mojom file.
# $1 is input filename.
# $2 is output directory.
# $3 is language (go, dart, ...).
MOJOM_BIN=$(MOJO_DIR)/src/mojo/public/tools/bindings/mojom_bindings_generator.py
define MOJOM_GEN
	mkdir -p $2
	$(MOJOM_BIN) $1 -d . -o $2 -g $3
endef

all: gen

# Builds the shared library that Mojo services must be linked with.
$(MOJO_SHARED_LIB):
ifeq ($(wildcard $(MOJO_BUILD_DIR)),)
	$(error ERROR: $(MOJO_BUILD_DIR) does not exist.  Please see README.md for instructions on compiling Mojo resources.)
endif
	mkdir -p $(dir $@)
	ar rcs $@ $(MOJO_BUILD_DIR)/obj/mojo/public/platform/native/system.system_thunks.o

gen: gen/dart-pkg/mojom/lib/mojo/examples/echo.mojom.dart gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/echo/echo.mojom.go gen/go/src/mojom/syncbase/syncbase.mojom.go

gen/dart-pkg/mojom/lib/mojo/examples/echo.mojom.dart: mojom/echo.mojom
	$(call MOJOM_GEN,$<,gen,dart)

gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,gen,dart)

gen/go/src/mojom/echo/echo.mojom.go: mojom/echo.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

.PHONY: clean
clean:
	rm -rf gen
