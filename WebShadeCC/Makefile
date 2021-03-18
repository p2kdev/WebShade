include $(THEOS)/makefiles/common.mk

export ARCHS = arm64 arm64e
export TARGET = iphone:clang:13.0:13.0

BUNDLE_NAME = WebShadeCC
$(BUNDLE_NAME)_BUNDLE_EXTENSION = bundle
$(BUNDLE_NAME)_CFLAGS +=  -fobjc-arc -I$(THEOS)/include
$(BUNDLE_NAME)_ADDITIONAL_FRAMEWORKS = ControlCenterUIKit
$(BUNDLE_NAME)_FILES = WebShadeCC.m
$(BUNDLE_NAME)_LDFLAGS += /opt/theos/include/Frameworks/ControlCenterUIKit.tbd
$(BUNDLE_NAME)_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
