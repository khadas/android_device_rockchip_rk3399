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

# First lunching is Q, api_level is 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_FSTAB_TEMPLATE := $(LOCAL_PATH)/fstab.in
PRODUCT_DTBO_TEMPLATE := $(LOCAL_PATH)/dt-overlay.in
PRODUCT_BOOT_DEVICE := fe330000.sdhci
include device/rockchip/common/build/rockchip/DynamicPartitions.mk
include device/rockchip/common/BoardConfig.mk
include device/rockchip/rk3399/rk3399_Android10/BoardConfig.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3399/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)

#enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := rk3399_Android10
PRODUCT_DEVICE := rk3399_Android10
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := rk3399-Android10
PRODUCT_MANUFACTURER := Khadas
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
    SoundRecorder

BUILD_NUMBER2 := $(shell $(DATE) +%Y%m%d)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.display.id=Edge-Android-10-$(BUILD_NUMBER2)
   
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.rotation.efull=true \
	persist.vendor.sys.hdmiui=1 \
	persist.sys.app.rotation=force_land \
	sys.magisk.adb.root=1 \
# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_COPY_FILES += device/rockchip/rk3399/rk3399_Android10/cmdserver:system/bin/cmdserver
PRODUCT_COPY_FILES += device/rockchip/rk3399/rk3399_Android10/cmdclient:system/bin/cmdclient
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.0 \
    ro.product.ota.host = www.rockchip.com:2300 \
    ro.sf.lcd_density=280

PRODUCT_PROPERTY_OVERRIDES += \
   service.adb.tcp.port=5555

# bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:product/media/bootanimation.zip   
#Factory test
PRODUCT_PACKAGES += \
   FactoryTest

#i2c tools
PRODUCT_PACKAGES += \
   i2cget \
   i2cset \
   i2cdump \
   i2cdetect
   
BUILD_WITH_GAPPS_CONFIG :=false
ifeq ($(BUILD_WITH_GAPPS_CONFIG),true)
$(call inherit-product-if-exists, vendor/rockchip/google/gapps.mk)
endif  
#PRODUCT_HAVE_OPTEE := true
