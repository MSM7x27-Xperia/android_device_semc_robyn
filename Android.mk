LOCAL_PATH := $(my-dir)

ifeq ($(TARGET_DEVICE),robyn)
    subdir_makefiles := \
        $(LOCAL_PATH)/libcopybit/Android.mk \
        $(LOCAL_PATH)/hciattach/Android.mk \
        $(LOCAL_PATH)/libstagefrighthw/Android.mk
    include $(subdir_makefiles)
endif
