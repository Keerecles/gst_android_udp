LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := tutorial-3
LOCAL_SRC_FILES := tutorial-3.c
LOCAL_SHARED_LIBRARIES := gstreamer_android
LOCAL_LDLIBS := -llog -landroid
include $(BUILD_SHARED_LIBRARY)

ifndef GSTREAMER_SDK_ROOT
ifndef GSTREAMER_SDK_ROOT_ANDROID
GSTREAMER_SDK_ROOT_ANDROID  :=/home/keerelces/gstreamer-sdk-android-arm-release-2013.6
endif
GSTREAMER_SDK_ROOT        := $(GSTREAMER_SDK_ROOT_ANDROID)
endif
GSTREAMER_NDK_BUILD_PATH  := $(GSTREAMER_SDK_ROOT)/share/gst-android/ndk-build/
include $(GSTREAMER_NDK_BUILD_PATH)/plugins.mk
GSTREAMER_PLUGINS         := $(GSTREAMER_PLUGINS_CORE) $(GSTREAMER_PLUGINS_SYS) $(GSTREAMER_PLUGINS_EFFECTS) $(GSTREAMER_PLUGINS_NET) $(GSTREAMER_PLUGINS_CODECS_RESTRICTED) $(GSTREAMER_PLUGINS_PLAYBACK) $(GSTREAMER_PLUGINS_CODECS) $(GSTREAMER_PLUGINS_ENCODING)
GSTREAMER_EXTRA_DEPS      := gstreamer-interfaces-0.10 gstreamer-video-0.10
include $(GSTREAMER_NDK_BUILD_PATH)/gstreamer.mk
