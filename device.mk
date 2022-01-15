### PLATFORM
$(call inherit-product, device/sony/yoshino-common/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/lilac/lilac-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif
ifeq ($(WITH_MICROG),true)
$(call inherit-product, vendor/microg/microg-vendor.mk)
endif

ifeq ($(WITH_OPENGAPPS),true)
GAPPS_VARIANT := micro
GAPPS_FORCE_PACKAGE_OVERRIDES := true
DONT_DEXPREOPT_PREBUILTS := true
GAPPS_FORCE_MMS_OVERRIDES := true
GAPPS_FORCE_DIALER_OVERRIDES := true
# GAPPS From mini
GAPPS_PRODUCT_PACKAGES += PrebuiltDeskClockGoogle CalculatorGoogle CarrierServices YouTube
# GAPPS From full
GAPPS_PRODUCT_PACKAGES += Drive PrebuiltKeep PlayGames Recorder
# GAPPS From stock
GAPPS_PRODUCT_PACKAGES += ContactsGoogle StorageManagerGoogle GooglePay CalendarGooglePrebuilt LatinImeGoogle StorageManagerGoogle TranslatePrebuilt GoogleVrCore Wallet
# GAPPS From super
GAPPS_PRODUCT_PACKAGES += EditorsDocs EditorsSheets DMAgent

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif

### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/sony/lilac

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

### POWER
TARGET_USE_CUSTOM_POWERHINT := true

include $(DEVICE_PATH)/device/*.mk
