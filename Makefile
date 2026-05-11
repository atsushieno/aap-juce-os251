
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

# JUCE patches if any
JUCE_PATCHES= \
	$(PWD)/external/aap-juce/juce-patches/7.0.6/export-jni-symbols.patch \
	$(PWD)/external/aap-juce/juce-patches/7.0.6/support-plugin-ui.patch \
	$(PWD)/external/aap-juce/juce-patches/7.0.11/disable-cgwindowlistcreateimage.patch \
	$(PWD)/external/aap-juce/juce-patches/7.0.11/juce-component-peer-view-touch.patch \
	$(PWD)/external/aap-juce/juce-patches/7.0.11/popup-menu-android.patch

include $(AAP_JUCE_DIR)/Makefile.cmake-common

