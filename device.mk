#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)
# Call the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/munch-miuicamera/products/miuicamera.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := $(PRODUCT_SHIPPING_API_LEVEL)

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/st_license.lic:$(TARGET_COPY_OUT_VENDOR)/etc/camera/st_license.lic

# IDC
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/idc/,$(TARGET_COPY_OUT_VENDOR)/usr/idc)

# Keylayout
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/munch/munch-vendor.mk)
