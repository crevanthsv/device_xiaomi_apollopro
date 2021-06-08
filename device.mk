#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/apollopro/apollopro-vendor.mk)

PRODUCT_BUILD_SUPER_PARTITION := false
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# AAPT config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti

# Camera
PRODUCT_PACKAGES += \
    Snap

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_apollopro

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.rtt.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.apollopro

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

# Kernel modules
KERNEL_MODULES_ORIG := $(LOCAL_PATH)/prebuilt/modules
KERNEL_MODULES_DEST := $(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/lib/modules

PRODUCT_COPY_FILES += \
    $(KERNEL_MODULES_ORIG)/audio_adsp_loader.ko:$(KERNEL_MODULES_DEST)/audio_adsp_loader.ko \
    $(KERNEL_MODULES_ORIG)/audio_apr.ko:$(KERNEL_MODULES_DEST)/audio_apr.ko \
    $(KERNEL_MODULES_ORIG)/audio_bolero_cdc.ko:$(KERNEL_MODULES_DEST)/audio_bolero_cdc.ko \
    $(KERNEL_MODULES_ORIG)/audio_cs35l41.ko:$(KERNEL_MODULES_DEST)/audio_cs35l41.ko \
    $(KERNEL_MODULES_ORIG)/audio_hdmi.ko:$(KERNEL_MODULES_DEST)/audio_hdmi.ko \
    $(KERNEL_MODULES_ORIG)/audio_machine_kona.ko:$(KERNEL_MODULES_DEST)/audio_machine_kona.ko \
    $(KERNEL_MODULES_ORIG)/audio_mbhc.ko:$(KERNEL_MODULES_DEST)/audio_mbhc.ko \
    $(KERNEL_MODULES_ORIG)/audio_native.ko:$(KERNEL_MODULES_DEST)/audio_native.ko \
    $(KERNEL_MODULES_ORIG)/audio_pinctrl_lpi.ko:$(KERNEL_MODULES_DEST)/audio_pinctrl_lpi.ko \
    $(KERNEL_MODULES_ORIG)/audio_pinctrl_wcd.ko:$(KERNEL_MODULES_DEST)/audio_pinctrl_wcd.ko \
    $(KERNEL_MODULES_ORIG)/audio_platform.ko:$(KERNEL_MODULES_DEST)/audio_platform.ko \
    $(KERNEL_MODULES_ORIG)/audio_q6.ko:$(KERNEL_MODULES_DEST)/audio_q6.ko \
    $(KERNEL_MODULES_ORIG)/audio_q6_notifier.ko:$(KERNEL_MODULES_DEST)/audio_q6_notifier.ko \
    $(KERNEL_MODULES_ORIG)/audio_q6_pdr.ko:$(KERNEL_MODULES_DEST)/audio_q6_pdr.ko \
    $(KERNEL_MODULES_ORIG)/audio_rx_macro.ko:$(KERNEL_MODULES_DEST)/audio_rx_macro.ko \
    $(KERNEL_MODULES_ORIG)/audio_snd_event.ko:$(KERNEL_MODULES_DEST)/audio_snd_event.ko \
    $(KERNEL_MODULES_ORIG)/audio_stub.ko:$(KERNEL_MODULES_DEST)/audio_stub.ko \
    $(KERNEL_MODULES_ORIG)/audio_swr.ko:$(KERNEL_MODULES_DEST)/audio_swr.ko \
    $(KERNEL_MODULES_ORIG)/audio_swr_ctrl.ko:$(KERNEL_MODULES_DEST)/audio_swr_ctrl.ko \
    $(KERNEL_MODULES_ORIG)/audio_tfa98xx.ko:$(KERNEL_MODULES_DEST)/audio_tfa98xx.ko \
    $(KERNEL_MODULES_ORIG)/audio_tx_macro.ko:$(KERNEL_MODULES_DEST)/audio_tx_macro.ko \
    $(KERNEL_MODULES_ORIG)/audio_usf.ko:$(KERNEL_MODULES_DEST)/audio_usf.ko \
    $(KERNEL_MODULES_ORIG)/audio_va_macro.ko:$(KERNEL_MODULES_DEST)/audio_va_macro.ko \
    $(KERNEL_MODULES_ORIG)/audio_wcd938x.ko:$(KERNEL_MODULES_DEST)/audio_wcd938x.ko \
    $(KERNEL_MODULES_ORIG)/audio_wcd938x_slave.ko:$(KERNEL_MODULES_DEST)/audio_wcd938x_slave.ko \
    $(KERNEL_MODULES_ORIG)/audio_wcd9xxx.ko:$(KERNEL_MODULES_DEST)/audio_wcd9xxx.ko \
    $(KERNEL_MODULES_ORIG)/audio_wcd_core.ko:$(KERNEL_MODULES_DEST)/audio_wcd_core.ko \
    $(KERNEL_MODULES_ORIG)/audio_wsa881x.ko:$(KERNEL_MODULES_DEST)/audio_wsa881x.ko \
    $(KERNEL_MODULES_ORIG)/audio_wsa_macro.ko:$(KERNEL_MODULES_DEST)/audio_wsa_macro.ko \
    $(KERNEL_MODULES_ORIG)/br_netfilter.ko:$(KERNEL_MODULES_DEST)/br_netfilter.ko \
    $(KERNEL_MODULES_ORIG)/exfat.ko:$(KERNEL_MODULES_DEST)/exfat.ko \
    $(KERNEL_MODULES_ORIG)/gspca_main.ko:$(KERNEL_MODULES_DEST)/gspca_main.ko \
    $(KERNEL_MODULES_ORIG)/lcd.ko:$(KERNEL_MODULES_DEST)/lcd.ko \
    $(KERNEL_MODULES_ORIG)/llcc_perfmon.ko:$(KERNEL_MODULES_DEST)/llcc_perfmon.ko \
    $(KERNEL_MODULES_ORIG)/modules.alias:$(KERNEL_MODULES_DEST)/modules.alias \
    $(KERNEL_MODULES_ORIG)/modules.dep:$(KERNEL_MODULES_DEST)/modules.dep \
    $(KERNEL_MODULES_ORIG)/mpq-adapter.ko:$(KERNEL_MODULES_DEST)/mpq-adapter.ko.ko \
    $(KERNEL_MODULES_ORIG)/mpq-dmx-hw-plugin.ko:$(KERNEL_MODULES_DEST)/mpq-dmx-hw-plugin.ko.ko \
    $(KERNEL_MODULES_ORIG)/qca_cld3_wlan.ko:$(KERNEL_MODULES_DEST)/qca_cld3_wlan.ko \
    $(KERNEL_MODULES_ORIG)/rdbg.ko:$(KERNEL_MODULES_DEST)/rdbg.ko \
    $(KERNEL_MODULES_ORIG)/rmnet_perf.ko:$(KERNEL_MODULES_DEST)/rmnet_perf.ko \
    $(KERNEL_MODULES_ORIG)/rmnet_shs.ko:$(KERNEL_MODULES_DEST)/rmnet_shs.ko \
    $(KERNEL_MODULES_ORIG)/sla.ko:$(KERNEL_MODULES_DEST)/sla.ko

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
