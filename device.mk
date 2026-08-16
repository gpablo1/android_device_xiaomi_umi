#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Fingerprint
TARGET_HAS_UDFPS := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    libMegviiFacepp-0.5.2 \
    libmegface \
    libpiex_shim

# Display
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,qdcm_calib_data_*.xml,$(LOCAL_PATH)/qdcm/,$(TARGET_COPY_OUT_VENDOR)/etc/)

# DSP Volume Synchronizer
# PRODUCT_PACKAGES += \
#    DSPVolumeSynchronizer

# Init
$(call soong_config_set,xiaomi_kona,variant_lib,//$(LOCAL_PATH):libvariant_xiaomi_umi)

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayDevice \
    FrameworkResOverlayDevice \
    LineageSettingsOverlayDevice \
    LineageSDKOverlayDevice \
    LineageSystemUIOverlayDevice \
    SystemUIOverlayDevice

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

$(call soong_config_set,lineage_powershare,powershare_path,/sys/class/power_supply/wireless/reverse_chg_mode)

# Rootdir
PRODUCT_PACKAGES += \
    init.device.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Haptic feedback
PRODUCT_VENDOR_PROPERTIES += \
    sys.haptic.down.weak=0 \
    sys.haptic.down.normal=2 \
    sys.haptic.down.strong=4 \
    sys.haptic.down=3,2 \
    sys.haptic.tap.normal=3,2 \
    sys.haptic.tap.light=3,1 \
    sys.haptic.flick=3,2 \
    sys.haptic.flick.light=3,1 \
    sys.haptic.switch=3,1 \
    sys.haptic.mesh.heavy=3,2 \
    sys.haptic.mesh.normal=3,1 \
    sys.haptic.mesh.light=3,0 \
    sys.haptic.long.press=3,2 \
    sys.haptic.popup.normal=3,2 \
    sys.haptic.popup.light=3,1 \
    sys.haptic.pickup=3,2 \
    sys.haptic.scroll.edge=3,0 \
    sys.haptic.trigger.drawer=3,0 \
    sys.haptic.hold=3,2 \
    sys.haptic.runin=13

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/umi/umi-vendor.mk)

# Call HyperOS Gallery,GalleryEditor,VideoPlayer
$(call inherit-product-if-exists, vendor/xiaomi/miui-apps/miui-apps.mk)

# Viper4AndroidFX
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)

# Camera
#$(call inherit-product-if-exists, vendor/xiaomi/miuicamera-sm8250/miuicamera.mk)
$(call inherit-product-if-exists, device/xiaomi/camera/miuicamera.mk)

# Miuiapps
$(call inherit-product, vendor/xiaomi/miuiapps/config.mk)

# GcamGo
$(call inherit-product-if-exists, vendor/gcgop/config.mk)
