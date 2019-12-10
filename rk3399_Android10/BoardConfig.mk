include device/rockchip/rk3399/BoardConfig.mk

BOARD_SENSOR_ST := true
BOARD_SENSOR_COMPASS_AK8963-64 = true
BOARD_SENSOR_MPU_PAD := false
BOARD_COMPASS_SENSOR_SUPPORT := true
BOARD_GYROSCOPE_SENSOR_SUPPORT := true
BUILD_WITH_GOOGLE_GMS_EXPRESS := false
CAMERA_SUPPORT_AUTOFOCUS:= false
ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
TARGET_RECOVERY_FSTAB := device/rockchip/rk3399/rk3399_Android10/fstab.rk30board_AB
endif
