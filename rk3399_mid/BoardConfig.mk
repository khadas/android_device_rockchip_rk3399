include device/rockchip/rk3399/BoardConfig.mk

BOARD_SENSOR_ST := true
BOARD_SENSOR_MPU_PAD := false
BUILD_WITH_GOOGLE_GMS_EXPRESS := false
CAMERA_SUPPORT_AUTOFOCUS:= false

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
TARGET_RECOVERY_FSTAB := device/rockchip/rk3399/rk3399_mid/fstab.rk30board_AB
endif

# Android Q use odm instead of oem, but for upgrading to Q, partation list cant be changed, odm will mount at /dev/block/by-name/oem
BOARD_ODMIMAGE_PARTITION_SIZE := $(shell python device/rockchip/common/get_partition_size.py device/rockchip/rk3399/rk3399_mid/parameter.txt oem)

# No need to place dtb into boot.img for the device upgrading to Q.
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_PREBUILT_DTBIMAGE_DIR :=

#Need to build system as root for the device upgrading to Q.
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
