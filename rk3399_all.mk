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

$(call inherit-product, $(LOCAL_PATH)/rk3399.mk)

PRODUCT_NAME := rk3399_all
PRODUCT_DEVICE := rk3399_all
PRODUCT_MODEL := Edge
PRODUCT_BRAND := Khadas
PRODUCT_MANUFACTURER := Khadas

PRODUCT_AAPT_CONFIG := normal large mdpi tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_SYSTEM_VERITY := true

# debug-logs
ifneq ($(TARGET_BUILD_VARIANT),user)
MIXIN_DEBUG_LOGS := true
endif

BOARD_USE_APP_ALARM_ALIGNMENT ?= false

# google apps
BUILD_WITH_GOOGLE_MARKET := false
BUILD_WITH_GOOGLE_MARKET_ALL := false
BUILD_WITH_GOOGLE_FRP := false

#for data encrypt options
BUILD_WITH_FORCEENCRYPT := true

#for GMS Certification
BUILD_WITH_GMS_CER := false

#for drm widevine
BUILD_WITH_WIDEVINE := true

#for cts requirement
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1 \
    persist.sys.usb.config=mtp
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb
endif

BUILD_NUMBER := $(shell $(DATE) +%Y%m%d)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.display.id=Edge_Nougat_$(BUILD_NUMBER)

BOOT_SHUTDOWN_ANIMATION_RINGING := false

BOARD_NFC_SUPPORT := false
BOARD_HAS_GPS := false

#for 3G/4G modem dongle support
BOARD_HAVE_DONGLE := false


BOARD_GRAVITY_SENSOR_SUPPORT := true
BOARD_COMPASS_SENSOR_SUPPORT := true
BOARD_GYROSCOPE_SENSOR_SUPPORT := true
BOARD_PROXIMITY_SENSOR_SUPPORT := false
BOARD_LIGHT_SENSOR_SUPPORT := true
BOARD_PRESSURE_SENSOR_SUPPORT := false
BOARD_TEMPERATURE_SENSOR_SUPPORT := false
BOARD_USB_HOST_SUPPORT := true
PRODUCT_HAS_CAMERA := true
TARGET_ROCKCHIP_PCBATEST := false

#for ddr var support
BOARD_DDR_VAR_ENABLED := true

PRODUCT_COPY_FILES += \
   device/rockchip/rk3399/rk3399_all/ddr_config.xml:system/etc/ddr_config.xml \
   device/rockchip/rk3399/rk3399_all/video_status:system/etc/video_status \
   device/rockchip/common/resolution_white.xml:/system/usr/share/resolution_white.xml

#for rockchip auto test scripts
PRODUCT_COPY_FILES += \
   device/rockchip/rk3399/rockchip_test/ddr/memtester_64bit:/system/bin/memtester \
   device/rockchip/rk3399/rockchip_test/ddr/stressapptest:/system/bin/stressapptest \
   device/rockchip/rk3399/rockchip_test/ddr/libstlport.so:/system/lib/libstlport.so \
   device/rockchip/rk3399/rockchip_test/ddr/ddr_test.sh:/system/bin/ddr_test.sh \
   device/rockchip/rk3399/rockchip_test/ddr/memtester_test.sh:/system/bin/memtester_test.sh \
   device/rockchip/rk3399/rockchip_test/ddr/stressapptest_test.sh:/system/bin/stressapptest_test.sh \
   device/rockchip/rk3399/rockchip_test/dvfs/auto_cpu_freq_test.sh:/system/bin/auto_cpu_freq_test.sh \
   device/rockchip/rk3399/rockchip_test/dvfs/auto_ddr_freq_test.sh:/system/bin/auto_ddr_freq_test.sh \
   device/rockchip/rk3399/rockchip_test/dvfs/auto_gpu_freq_test.sh:/system/bin/auto_gpu_freq_test.sh \
   device/rockchip/rk3399/rockchip_test/dvfs/dvfs_test.sh:/system/bin/dvfs_test.sh \
   device/rockchip/rk3399/rockchip_test/rockchip_test.sh:/system/bin/rockchip_test.sh


PRODUCT_PACKAGES += \
    SoundRecorder

# enable sdcardfs to fix problem which caused by ntfs + fuse
# and also optimize the filesystem access speed.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

#PRODUCT_HAVE_OPTEE := true
