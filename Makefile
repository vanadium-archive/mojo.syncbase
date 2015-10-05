PWD := $(shell pwd)
DART_FILES := $(shell find dart/bin dart/lib dart/test -name "*.dart" -not -path "dart/lib/gen/*")
V23_GO_FILES := $(shell find $(JIRI_ROOT) -name "*.go")

include ../shared/mojo.mk

# Flags for Syncbase service running as Mojo service.
V23_MOJO_FLAGS := --v=0

# MOUNTTABLE_ADDR := 127.0.0.1:4001
ifdef MOUNTTABLE_ADDR
	# TODO(nlacasse): Get your email address out of here!
	MOUNT_NAME := users/nlacasse@google.com/syncbase_mojo
	V23_MOJO_FLAGS += --name=$(MOUNT_NAME) --v23.proxy=proxy --v23.namespace.root=$(MOUNTTABLE_ADDR)
endif

ifdef ANDROID
	ETHER_BUILD_DIR := $(PWD)/gen/mojo/android

	THIRD_PARTY_LIBS := $(JIRI_ROOT)/third_party/cout/android_arm

	# NOTE(nlacasse): Trying to write to a directory that the app does not have
	# permission to causes a crash with no stack trace.  Because of this, we
	# set logtostderr=true to prevent vlog from writing logs to directories we
	# don't have permissions on.  (Alternatively, we could set --log_dir to a
	# directory inside APP_HOME_DIR.)  We set syncbase root-dir inside
	# APP_HOME_DIR for the same reason.
	APP_HOME_DIR = /data/data/org.chromium.mojo.shell/app_home
	ANDROID_CREDS_DIR := /sdcard/v23creds
	V23_MOJO_FLAGS += --logtostderr=true --root-dir=$(APP_HOME_DIR)/syncbase_data --v23.credentials=$(ANDROID_CREDS_DIR)
else
	ETHER_BUILD_DIR := $(PWD)/gen/mojo/linux_amd64

	THIRD_PARTY_LIBS := $(JIRI_ROOT)/third_party/cout/linux_amd64

	SYNCBASE_ROOT_DIR := $(PWD)/tmp/syncbase_data
	V23_MOJO_FLAGS += --root-dir=$(SYNCBASE_ROOT_DIR) --v23.credentials=$(PWD)/creds
endif

# NOTE(nlacasse): Running Go Mojo services requires passing the
# --enable-multiprocess flag to mojo_shell.  This is because the Go runtime is
# very large, and can interfere with C++ memory if they are in the same
# process.
MOJO_SHELL_FLAGS := $(MOJO_SHELL_FLAGS) \
	--config-alias ETHER_DIR=$(PWD) \
	--config-alias ETHER_BUILD_DIR=$(ETHER_BUILD_DIR) \
	"--args-for=https://mojo.v.io/syncbase_server.mojo $(V23_MOJO_FLAGS)"

.DELETE_ON_ERROR:

all: test

.PHONY: build
build: $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom

# Builds mounttabled, principal, and syncbased.
bin: $(V23_GO_FILES) | syncbase-env-check
	jiri go build -a -o $@/mounttabled v.io/x/ref/services/mounttable/mounttabled
	jiri go build -a -o $@/principal v.io/x/ref/cmd/principal
	jiri go build -a -o $@/syncbased v.io/x/ref/services/syncbase/syncbased
	touch $@

# Mints credentials.
creds: | bin
	./bin/principal seekblessings --v23.credentials creds
	touch $@

.PHONY: gen-mojom
gen-mojom: dart/lib/gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart gen/go/src/mojom/syncbase/syncbase.mojom.go

dart/lib/gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart: mojom/syncbase.mojom | syncbase-env-check
	$(call MOJOM_GEN,$<,dart/lib/gen,dart)
	# TODO(nlacasse): mojom_bindings_generator creates bad symlinks on dart
	# files, so we delete them.  Stop doing this once the generator is fixed.
	# See https://github.com/domokit/mojo/issues/386
	rm -f dart/lib/gen/mojom/$(notdir $@)

gen/go/src/mojom/syncbase/syncbase.mojom.go: mojom/syncbase.mojom | syncbase-env-check
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
$(ETHER_BUILD_DIR)/syncbase_server.mojo: $(V23_GO_FILES) $(MOJO_SHARED_LIB) gen/go/src/mojom/syncbase/syncbase.mojom.go | syncbase-env-check
	$(call MOGO_BUILD,v.io/x/ref/services/syncbase/syncbased,$@)

# Formats dart files to follow dart style conventions.
.PHONY: dartfmt
dartfmt: dart/packages
	dartfmt --overwrite $(DART_FILES)

# Lints src and test files with dartanalyzer. This takes a few seconds.
.PHONY: dartanalyzer
dartanalyzer: dart/packages gen-mojom
	# TODO(nlacasse): Fix dart mojom binding generator so it does not produce
	# files that violate dartanalyzer.  For now, we use "grep -v" to hide all
	# hints and warnings from *.mojom.dart files.
	cd dart && dartanalyzer bin/*.dart lib/*.dart test/**/*.dart | grep -v "\.mojom\.dart, line"

# Installs dart dependencies.
.PHONY: dart/packages
dart/packages:
	cd dart && pub upgrade

.PHONY: run-syncbase-example
run-syncbase-example: $(ETHER_BUILD_DIR)/syncbase_server.mojo dart/packages dart/lib/gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart | syncbase-env-check creds
ifdef ANDROID
	adb push -p $(PWD)/creds $(ANDROID_CREDS_DIR)
endif
	$(call MOJO_RUN,"https://mojo.v.io/syncbase_example.dart $(MOUNTTABLE_ADDR)")

.PHONY: test
test: test-unit test-integration

.PHONY: test-unit
test-unit: dart/packages
	cd dart && pub run test test/unit/*.dart

.PHONY: test-integration
test-integration: dart/packages $(ETHER_BUILD_DIR)/syncbase_server.mojo gen-mojom | syncbase-env-check
ifdef MOUNTTABLE_ADDR
	$(error please unset MOUNTTABLE_ADDR before running the tests)
endif
	# Delete the 'creds' dir to make sure we are running with in-memory
	# credentials.  Otherwise tests time out.
	# TODO(nlacasse): Figure out why tests time out with dev.v.io credentials.
	# Maybe caveat validation?
	rm -rf $(PWD)/creds
	# NOTE(nlacasse): The "tests" argument must come before the "MOJO_SHELL_FLAGS" flags,
	# otherwise mojo_test's argument parser gets confused and exits with an error.
	$(MOJO_DIR)/src/mojo/devtools/common/mojo_test tests --config-file $(PWD)/mojoconfig --shell-path $(MOJO_SHELL_PATH) $(MOJO_ANDROID_FLAGS) $(MOJO_SHELL_FLAGS)

.PHONY: syncbase-env-check
syncbase-env-check: | mojo-env-check
ifeq ($(wildcard $(THIRD_PARTY_LIBS)),)
ifdef ANDROID
	$(error ERROR: $(THIRD_PARTY_LIBS) does not exist or is empty.  Please run "GOOS=android GOARCH=arm jiri profile install syncbase")
else
	$(error ERROR: $(THIRD_PARTY_LIBS) does not exist or is empty.  Please run "jiri profile install syncbase")
endif
endif

# TODO(aghassemi): Why does mojo generate dart-pkg and mojom dirs?
.PHONY: clean
clean:
	rm -rf bin creds gen tmp
	rm -rf dart/lib/gen/dart-pkg
	rm -rf dart/lib/gen/mojom

.PHONY: veryclean
veryclean: clean
	rm -rf dart/{.packages,pubspec.lock,packages}
