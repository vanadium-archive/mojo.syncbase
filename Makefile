PWD := $(shell pwd)
DART_FILES := $(shell find dart/bin dart/lib dart/test sky_demo/lib -name "*.dart" -not -path "dart/lib/gen/*")
GO_FILES := $(shell find go/src -name "*.go")
V23_GO_FILES := $(shell find $(V23_ROOT) -name "*.go")

include ../shared/mojo.mk

# Flags for Syncbase service running as Mojo service.
# See v.io/x/ref/runtime/internal/mojo_util.go for the wonderful magic that
# makes this work.
# If you change these flags, be sure to do a "make clean", since the flag values
# get bound at compile time.
SYNCBASED_ADDR := 127.0.0.1:4002
V23_MOJO_FLAGS := --v=0 --v23.tcp.address=$(SYNCBASED_ADDR) --v23.permissions.literal={\"Admin\":{\"In\":[\"...\"]},\"Write\":{\"In\":[\"...\"]},\"Read\":{\"In\":[\"...\"]},\"Resolve\":{\"In\":[\"...\"]},\"Debug\":{\"In\":[\"...\"]}}

# MOUNTTABLE_ADDR := 127.0.0.1:4001
ifdef MOUNTTABLE_ADDR
	V23_MOJO_FLAGS += --name=syncbase_mojo --v23.namespace.root=/$(MOUNTTABLE_ADDR)
endif

ifdef ANDROID
	SKY_BUILD_DIR := $(SKY_DIR)/src/out/android_Debug
	ETHER_BUILD_DIR := $(PWD)/gen/mojo/android

	THIRD_PARTY_LIBS := $(V23_ROOT)/third_party/cout/android_arm

	# NOTE(nlacasse): Trying to write to a directory that the app does not have
	# permission to causes a crash with no stack trace.  Because of this, we
	# set logtostderr=true to prevent vlog from writing logs to directories we
	# don't have permissions on.  (Alternatively, we could set --log_dir to a
	# directory inside APP_HOME_DIR.)  We set syncbase root-dir inside
	# APP_HOME_DIR for the same reason.
	APP_HOME_DIR = /data/data/org.chromium.mojo.shell/app_home
	V23_MOJO_FLAGS += --logtostderr=true --root-dir=$(APP_HOME_DIR)/syncbase_data
else
	SKY_BUILD_DIR := $(SKY_DIR)/src/out/Debug
	ETHER_BUILD_DIR := $(PWD)/gen/mojo/linux_amd64

	THIRD_PARTY_LIBS := $(V23_ROOT)/third_party/cout/linux_amd64

	V23_MOJO_FLAGS += --root-dir=/tmp/syncbase_data
endif

# NOTE(nlacasse): Running Go Mojo services requires passing the
# --enable-multiprocess flag to mojo_shell.  This is because the Go runtime is
# very large, and can interfere with C++ memory if they are in the same
# process.
MOJO_SHELL_FLAGS := $(MOJO_SHELL_FLAGS) \
	--config-alias ETHER_DIR=$(PWD) \
	--config-alias ETHER_BUILD_DIR=$(ETHER_BUILD_DIR)

.DELETE_ON_ERROR:

all: test

.PHONY: build
build: $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom

# Builds mounttabled, principal, and syncbased.
bin: $(V23_GO_FILES) | syncbase-env-check
	v23 go build -a -o $@/mounttabled v.io/x/ref/services/mounttable/mounttabled
	v23 go build -a -o $@/principal v.io/x/ref/cmd/principal
	v23 go build -a -o $@/syncbased v.io/x/ref/services/syncbase/syncbased
	touch $@

# Mints credentials.
creds: bin
	./bin/principal seekblessings --v23.credentials creds
	touch $@

.PHONY: gen-mojom
gen-mojom: dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/syncbase/syncbase.mojom.go

dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom
dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart: | syncbase-env-check
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): mojom_bindings_generator creates bad symlinks on dart
	# files, so we delete them.  Stop doing this once the generator is fixed.
	# See https://github.com/domokit/mojo/issues/386
	rm -f dart/lib/gen/mojom/$(notdir $@)

gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom
gen/go/src/mojom/syncbase/syncbase.mojom.go: | syncbase-env-check
	$(call MOJOM_GEN,$<,gen,go)
	gofmt -w $@

# TODO(nlacasse): These target-specific variables will affect this task and all
# pre-requisite tasks.  Luckily none of the prerequisites require that these
# variables have their original value, so everything works.  Once we have a
# prereq that requires the original value, we will need to re-work these
# variables.
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CFLAGS := -I$(THIRD_PARTY_LIBS)/leveldb/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_CXXFLAGS := -I$(THIRD_PARTY_LIBS)/leveldb/include
$(ETHER_BUILD_DIR)/syncbase_server.mojo: CGO_LDFLAGS := -L$(THIRD_PARTY_LIBS)/leveldb/lib -lleveldb -L$(THIRD_PARTY_LIBS)/snappy/lib -lsnappy
$(ETHER_BUILD_DIR)/syncbase_server.mojo: LDFLAGS := -X v.io/x/ref/runtime/internal.commandLineFlags '$(V23_MOJO_FLAGS)'
$(ETHER_BUILD_DIR)/syncbase_server.mojo: $(GO_FILES) $(V23_GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/syncbase/syncbase.mojom.go | syncbase-env-check
	$(call MOGO_BUILD,v.io/x/ref/services/syncbase/syncbased,$@)

# Formats dart files to follow dart style conventions.
.PHONY: dartfmt
dartfmt:
	dartfmt --overwrite $(DART_FILES)

# Lints src and test files with dartanalyzer. This takes a few seconds.
.PHONY: dartanalyzer
dartanalyzer: dart/packages sky_demo/packages gen-mojom
	# TODO(nlacasse): Fix dart mojom binding generator so it does not produce
	# files that violate dartanalyzer.  For now, we use "grep -v" to hide all
	# hints and warnings from *.mojom.dart files.
	cd dart && dartanalyzer bin/*.dart lib/*.dart test/*.dart | grep -v "\.mojom\.dart, line"
	cd sky_demo && dartanalyzer lib/*.dart | grep -v "\.mojom\.dart, line"

# Installs dart dependencies.
dart/packages: dart/pubspec.yaml
	cd dart && pub get

# Installs dart dependencies.
sky_demo/packages: sky_demo/pubspec.yaml
	cd sky_demo && pub get

.PHONY: run-syncbase-example
run-syncbase-example: $(ETHER_BUILD_DIR)/syncbase_server.mojo dart/packages dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart | syncbase-env-check
	$(call MOJO_RUN,https://mojo.v.io/syncbase_example.dart)

.PHONY: run-sky-demo
run-sky-demo: MOJO_SHELL_FLAGS += --config-alias SKY_DIR=$(SKY_DIR) --config-alias SKY_BUILD_DIR=$(SKY_BUILD_DIR)
run-sky-demo: sky_demo/packages $(ETHER_BUILD_DIR)/syncbase_server.mojo dart/lib/gen/dart-pkg/mojom/lib/mojo/syncbase.mojom.dart | syncbase-env-check
ifndef SKY_DIR
	$(error SKY_DIR is not set)
endif
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_run --config-file $(PWD)/sky_demo/mojoconfig $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) 'mojo:window_manager https://mojo.v.io/sky_demo/lib/main.dart'

.PHONY: test
test: dart/packages $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom | syncbase-env-check
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_test --config-file $(PWD)/mojoconfig $(MOJO_SHELL_FLAGS) $(MOJO_ANDROID_FLAGS) --shell-path $(MOJO_SHELL_PATH) tests

.PHONY: syncbase-env-check
syncbase-env-check: | mojo-env-check
ifeq ($(wildcard $(THIRD_PARTY_LIBS)),)
ifdef ANDROID
	$(error ERROR: $(THIRD_PARTY_LIBS) does not exist or is empty.  Please run "GOOS=android GOARCH=arm v23 profile install syncbase")
else
	$(error ERROR: $(THIRD_PARTY_LIBS) does not exist or is empty.  Please run "v23 profile install syncbase")
endif
endif

.PHONY: clean
clean:
	rm -rf gen/mojo gen/go
	rm -rf dart/lib/gen

.PHONY: veryclean
veryclean: clean
	rm -rf gen
	rm -rf {dart,sky_demo}/{.packages,pubspec.lock,packages}
