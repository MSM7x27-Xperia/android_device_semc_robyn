LOCAL_PATH := $(my-dir)

ifeq ($(TARGET_DEVICE),robyn)
    subdir_makefiles := \
        $(LOCAL_PATH)/libaudio/Android.mk \
        $(LOCAL_PATH)/libgralloc/Android.mk \
        $(LOCAL_PATH)/libcopybit/Android.mk \
        $(LOCAL_PATH)/libstagefrighthw/Android.mk
    include $(subdir_makefiles)
endif
