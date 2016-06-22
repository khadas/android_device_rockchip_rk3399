#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    ro.opengles.version=196609

PRODUCT_PACKAGES += \
    Launcher3

#enable this for support f2fs with data partion
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
#ifeq ($(HOST_OS),linux)
#TARGET_USERIMAGES_USE_F2FS := true
#endif

#copy init.rc for tablet or box product
#ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rk3399_box/init.rc:root/init.rc
#else
#ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), tablet)
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rk3399_32/init.rc:root/init.rc
#endif
#endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.${TARGET_BOARD_PLATFORM_PRODUCT}.rc:root/init.${TARGET_BOARD_PLATFORM_PRODUCT}.rc \
    $(LOCAL_PATH)/fstab.rk30board.bootmode.unknown:root/fstab.rk30board.bootmode.unknown \
    $(LOCAL_PATH)/fstab.rk30board.bootmode.emmc:root/fstab.rk30board.bootmode.emmc \
    $(LOCAL_PATH)/debug/init.debug.rc:root/init.debug.rc \
	$(LOCAL_PATH)/init.rk30board.usb.rc:root/init.rk30board.usb.rc

# debug-logs
ifeq ($(MIXIN_DEBUG_LOGS),true)
ADDITIONAL_DEFAULT_PROPERTIES += ro.service.default_logfs=apklogfs
ADDITIONAL_DEFAULT_PROPERTIES += ro.intel.logger=/system/vendor/bin/logcatext
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_cnt=20
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_size=5000
BOARD_SEPOLICY_DIRS += $(local_path)/sepolicy/debug-logs
BOARD_SEPOLICY_M4DEFS += module_debug_logs=true
endif

# debug-crashlogd
ifeq ($(MIXIN_DEBUG_LOGS),true)

CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true
CRASHLOGD_MODULE_MODEM ?= true
CRASHLOGD_MODULE_BTDUMP := true
CRASHLOGD_USE_SD := false
CRASHLOGD_ARCH := sofia
endif

# debug-coredump
ifeq ($(MIXIN_DEBUG_LOGS),true)
BOARD_SEPOLICY_DIRS += $(local_path)/sepolicy/coredump

# Enable core dump for eng builds
ifeq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += persist.core.enabled=1
else
ADDITIONAL_DEFAULT_PROPERTIES += persist.core.enabled=0
endif
CRASHLOGD_COREDUMP := true
endif



# debug-unresponsive
ifneq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += sys.dropbox.max_size_kb=4096

ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.binder_stats.uiwdt=1
ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.binder_stats.anr=1
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/debug/init.logs.rc:root/init.logs.rc
PRODUCT_PACKAGES += \
    logcatext \
    elogs.sh \
    start_log_srv.sh \
    logcat_ep.sh
endif

# debug-crashlogd
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/debug/init.crashlogd.rc:root/init.crashlogd.rc \
  $(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/ingredients.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ingredients.conf) \
  $(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/crashlog.conf:$(TARGET_COPY_OUT_VENDOR)/etc/crashlog.conf)
PRODUCT_PACKAGES += \
    crashlogd \
    dumpstate_dropbox.sh
endif

# debug-coredump
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/debug/init.coredump.rc:root/init.coredump.rc
endif

# debug-phonedoctor
ifeq ($(MIXIN_DEBUG_LOGS),true)
# PRODUCT_PACKAGES += crash_package
endif
# debug-charging
# make console and adb available in charging mode for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/debug/init.debug-charging.rc:root/init.debug-charging.rc
endif

# debug-kernel
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/debug/init.kernel.rc:root/init.kernel.rc
endif

# debug-log-watch
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/debug/log-watch-kmsg.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/log-watch-kmsg.cfg \
    $(LOCAL_PATH)/debug/init.log-watch.rc:root/init.log-watch.rc

PRODUCT_PACKAGES += log-watch
endif
endif

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product-if-exists, vendor/rockchip/rk3399/device-vendor.mk)
