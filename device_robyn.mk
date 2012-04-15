# Copyright (C) 2012 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := robyn
PRODUCT_DEVICE := robyn
PRODUCT_MODEL := robyn

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/robyn/robyn-vendor.mk)

# Support files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# MediaProfiles configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Crappy headset files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/headset/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/headset/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/headset/hal_seport.default.so:system/lib/hw/hal_seport.default.so \
    $(LOCAL_PATH)/prebuilt/headset/libaudioeq.so:system/lib/libaudioeq.so \
    $(LOCAL_PATH)/prebuilt/headset/libsystemconnector_hal_jni.so:system/lib/libsystemconnector_hal_jni.so \
    $(LOCAL_PATH)/prebuilt/headset/libuinputdevicejni.so:system/lib/libsystemconnector/libuinputdevicejni.so \
    $(LOCAL_PATH)/prebuilt/headset/systemconnector.kcm.bin:system/usr/keychars/systemconnector.kcm.bin \
    $(LOCAL_PATH)/prebuilt/headset/systemconnector.kl:system/usr/keylayout/systemconnector.kl \
    $(LOCAL_PATH)/prebuilt/headset/SystemConnector.apk:system/app/SystemConnector.apk

# WiFi files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wlan/10dnsconf:system/etc/init.d/10dnsconf \
    $(LOCAL_PATH)/prebuilt/wlan/10hostapconf:system/etc/init.d/10hostapconf \
    $(LOCAL_PATH)/prebuilt/wlan/dhcpcd:system/bin/dhcpcd \
    $(LOCAL_PATH)/prebuilt/wlan/dnsmasq.conf:system/etc/wifi/dnsmasq.conf \
    $(LOCAL_PATH)/prebuilt/wlan/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_cu:system/bin/tiap_cu \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader:system/bin/tiap_loader \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader.sh:system/bin/tiap_loader.sh \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_firmware.bin:system/etc/wifi/tiwlan_firmware.bin \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_firmware_ap.bin:system/etc/wifi/softap/tiwlan_firmware_ap.bin \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_cu:system/bin/wlan_cu \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_loader:system/bin/wlan_loader

# Ramdisk files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.delta.usb.rc:root/init.delta.usb.rc

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.delta \
    audio_policy.delta \
    gralloc.msm7x27 \
    hwcomposer.default \
    gps.delta \
    libOmxCore \
    libmm-omxcore \
    libopencorehw

PRODUCT_LOCALES += mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
