include device/rockchip/rk3399/BoardConfig.mk

PRODUCT_PACKAGE_OVERLAYS += device/rockchip/rk3399/rk3399_mid/overlay
BOARD_SENSOR_ST := true
BOARD_SENSOR_MPU_PAD := false
BUILD_WITH_GOOGLE_GMS_EXPRESS := false
CAMERA_SUPPORT_AUTOFOCUS:= false

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
TARGET_RECOVERY_FSTAB := device/rockchip/rk3399/rk3399_mid/fstab.rk30board_AB
endif
