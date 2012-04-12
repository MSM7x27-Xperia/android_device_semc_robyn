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

#
# This file sets variables that control the way modules are built
# throughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Camera
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/semc/robyn/BoardConfigVendor.mk

# Inclide headers
TARGET_SPECIFIC_HEADER_PATH := device/semc/robyn/include

# Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_VFP := true

# Info
TARGET_BOOTLOADER_BOARD_NAME := delta
TARGET_OTA_ASSERT_DEVICE := E10i,E10a,robyn

# Kernel
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x20000000

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_HAVE_FM_RADIO_TI := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WLAN_DEVICE := wl1271
WPA_SUPPLICANT_VERSION := VER_0_6_X
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/tiwlan_drv.ko
WIFI_DRIVER_MODULE_NAME := tiwlan_drv
WIFI_FIRMWARE_LOADER := wlan_loader
WIFI_EXT_MODULE_PATH := /system/lib/modules/sdio.ko
WIFI_EXT_MODULE_NAME := sdio

# EGL
BOARD_EGL_CFG := device/semc/robyn/prebuilt/egl.cfg

# libaudio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CUSTOM_HCIATTACH := true

# Ril
TARGET_PROVIDES_LIBRIL := true

# Display
ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
BOARD_NO_RGBX_8888 := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_GRALLOC_USES_ASHMEM := true
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true

# Fix Refrashrate
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

# Overlay (HDMI Panel)
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_SF_BYPASS := false
TARGET_QCOM_HDMI_OUT := false

# GPS
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 1240
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := delta
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Recovery
BOARD_CUSTOM_BOOTIMG_MK := device/semc/robyn/custombootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "mkdir /cache/recovery;touch /cache/recovery/boot;sync;"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/semc/robyn/recovery/recovery_keys.c
BOARD_HAS_BOOT_RECOVERY := true
BOARD_HAS_SMALL_RECOVERY := true
BOARD_LDPI_RECOVERY := true

# JIT
WITH_JIT := true
HTTP := chrome
JS_ENGINE := v8

# SD Mount
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# A custom ota package maker for a device without a boot partition
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/semc/robyn/releasetools/semc_ota_from_target_files
TARGET_PREBUILT_KERNEL := device/semc/robyn/prebuilt/kernel

