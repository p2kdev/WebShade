PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WebShade

WebShade_FILES = Tweak.x
WebShade_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += WebShadeCC
include $(THEOS_MAKE_PATH)/aggregate.mk
