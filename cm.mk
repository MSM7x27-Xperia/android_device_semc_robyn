## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common OXP stuff.
$(call inherit-product, vendor/oxp/common_oxp_phone.mk)

# Inherit some common CM stuff.
# $(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/semc/robyn/device_robyn.mk)

# Setup device configuration
PRODUCT_RELEASE_NAME := E10i
PRODUCT_DEVICE := robyn
PRODUCT_NAME := cm_robyn
PRODUCT_BRAND := SEMC
PRODUCT_MODEL := X10 Mini
PRODUCT_MANUFACTURER := Sony Ericsson

# Release data
PRODUCT_VERSION_DEVICE_SPECIFIC := 03
TARGET_NO_LIVEWALLPAPERS := false
TARGET_BOOTANIMATION_NAME := vertical-240x320

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=E10i BUILD_ID=4.1.A.0.562 BUILD_DISPLAY_ID=ITL41F BUILD_FINGERPRINT="SEMC/LT18i_1255-1753/LT18i:4.0.3/4.1.A.0.572/zf1_3w:user/release-keys" PRIVATE_BUILD_DESC="LT18i-user 4.0.3 4.1.A.0.562 zf1_3w test-keys"
