SDK_DIR ?= sdk
VERSION ?= vdev

CFLAGS += -D'VERSION="${VERSION}"'

# Increase task buffer, we use lot of sensors and versions in this project
CFLAGS += -D'TWR_SCHEDULER_MAX_TASKS=26'
CFLAGS += -D'TWR_LS013B7DH03_400x200=1'

-include sdk/Makefile.mk

.PHONY: all
all: debug

.PHONY: sdk
sdk: sdk/Makefile.mk

.PHONY: update
update:
	@git submodule update --remote --merge sdk
	@git submodule update --remote --merge .vscode

sdk/Makefile.mk:
	@git submodule update --init sdk
	@git submodule update --init .vscode
