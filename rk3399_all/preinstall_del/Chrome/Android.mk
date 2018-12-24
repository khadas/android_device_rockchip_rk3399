LOCAL_PATH := $(my-dir)

LOCAL_PATH := $(my-dir)
include $(CLEAR_VARS)
LOCAL_APK_NAME := Chrome
LOCAL_POST_PROCESS_COMMAND := $(shell mkdir -p $(TARGET_OUT_VENDOR)/bundled_uninstall_back-app/$(LOCAL_APK_NAME) && cp $(LOCAL_PATH)/$(LOCAL_APK_NAME).apk $(TARGET_OUT_VENDOR)/bundled_uninstall_back-app/$(LOCAL_APK_NAME)/)
