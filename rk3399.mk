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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
include device/rockchip/rk3399/BoardConfig.mk
# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3399/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := rk3399
PRODUCT_DEVICE := rk3399
PRODUCT_BRAND := Khadas
PRODUCT_MODEL := rk3399
PRODUCT_MANUFACTURER := Khadas
PRODUCT_AAPT_PREF_CONFIG := hdpi

BUILD_NUMBER := $(shell $(DATE) +%Y%m%d)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.display.id=Edge_Pie_$(BUILD_NUMBER)
PRODUCT_PACKAGES += \
    SoundRecorder
	
#Gapps Build Config
BUILD_WITH_GAPPS_CONFIG :=false
#Root Build Config
BUILD_WITH_ROOT_CONFIG :=true
#Root menu on Settings
BUILD_WITH_ROOT_MENU := true
ifeq ($(strip $(BUILD_WITH_ROOT_MENU)), true)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root.menu=true
endif

PRODUCT_PROPERTY_OVERRIDES += \
	persist.hdmi.ui.state=2 \
    vendor.hwc.device.primary=HDMI-A \
    vendor.hwc.device.extend=DP
	#vendor.hwc.device.extend=DSI
	
# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.0 \
    ro.product.ota.host = www.rockchip.com:2300 \
    ro.sf.lcd_density=280

PRODUCT_PROPERTY_OVERRIDES += \
   service.adb.tcp.port=5555
   
#Factory test
PRODUCT_PACKAGES += \
   FactoryTest
   
#PRODUCT_HAVE_OPTEE := true
