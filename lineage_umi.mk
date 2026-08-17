#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from umi device
$(call inherit-product, device/xiaomi/umi/device.mk)

# Pixel features
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_INCLUDE_GOOGLE_DIALER := true
WITH_GMS := true
TARGET_CORE_GMS := true
TARGET_CORE_GMS_EXTRAS := true
TARGET_GMS_EXTRAS := true
WITH_PIXEL_OVERLAYS := true
WITH_PIXEL-STYLE := true
# Ship Google Camera
TARGET_PREBUILT_GOOGLE_CAMERA := true

# Extra Tags
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
BUILD_BCR := true
TARGET_DISABLE_EPPE := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_HAVE_SEC_NFC := true
# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := true

# Device Details
PRODUCT_NAME := lineage_umi
PRODUCT_DEVICE := umi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 10
PRODUCT_SYSTEM_NAME := umi
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080
PRODUCT_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kona

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Rising stuff
RISING_MAINTAINER := "gpablo1"
RISING_BATTERY := 4780mah
RISING_STORAGE := 256gb
RISING_RAM := 8gb
RISING_DISPLAY := 2340×1080
RISING_PACKAGE_TYPE := GAPPS
RISING_CHIPSET := "Snapdragon 865 5G"

# Keys
-include vendor/lineage-priv/keys/keys.mk

# Rising specific prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="umi-user 13 RKQ1.211001.001 V816.0.3.0.TJBMIXM release-keys" \
    BuildFingerprint=Xiaomi/umi_global/umi:13/RKQ1.211001.001/V816.0.3.0.TJBMIXM:user/release-keys \
    DeviceName=umi \
    DeviceProduct=umi \
    SystemDevice=umi \
    SystemName=umi \
    RisingChipset="Snapdragon 865 5G" \
    RisingMaintainer="gpablo1"
	
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.product=umi

# MiuiCamera: run Mialgo without remote MiPostProc service
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.mialgoengine.bypass=1