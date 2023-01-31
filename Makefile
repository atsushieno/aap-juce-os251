
PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=OS-251

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/OS-251
JUCE_DIR=$(APP_SRC_DIR)/lib/JUCE

BIN_NAME=Os251
APP_SHARED_CODE_LIBS="src/$(BIN_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a src/libOs251Binaries.a"

PATCH_FILE=$(PWD)/aap-juce-support.patch
PATCH_DEPTH=1

PRE_BUILD_TASKS=update-jsui

include $(AAP_JUCE_DIR)/Makefile.cmake-common

update-jsui:
	# Depending on the environment, you might need NODE_OPTIONS=openssl-legacy-provider
	cd external/OS-251/src/jsui && npm ci && npm run build || exit 1
