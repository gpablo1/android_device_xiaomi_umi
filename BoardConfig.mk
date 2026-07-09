#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/umi

# Display
TARGET_SCREEN_DENSITY := 440

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(DEVICE_PATH):init_xiaomi_umi)

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/umi.config

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# OTA assert
TARGET_OTA_ASSERT_DEVICE := umi

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit from the proprietary version
include vendor/xiaomi/umi/BoardConfigVendor.mk
