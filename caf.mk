# Define the product version
PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = K1
PRODUCT_VERSION_MAINTENANCE = 0

# TODO: establish release criteria
# CAF_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)-$(CAF_BUILD)
CAF_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(CAF_BUILD)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.caf.version=$(CAF_VERSION) \

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/caf/backuptool/backuptool.sh:system/bin/backuptool.sh \
    vendor/caf/backuptool/backuptool.functions:system/bin/backuptool.functions \
    vendor/caf/backuptool/blacklist:system/addon.d/blacklist
    
# APN list for GSM devices
PRODUCT_COPY_FILES += \
    vendor/caf/telephony/apns-conf.xml:system/etc/apns-conf.xml

# Embed the Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

PRODUCT_PACKAGES += \
    Superuser \
    su

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

else

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

endif

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/caf/prebuilt/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/caf/prebuilt/PFFprec_600.emd:system/media/PFFprec_600.emd

# Some optional packages
PRODUCT_PACKAGES += \
    LockClock

# Other misc packages not automatically built
PRODUCT_PACKAGES += \
    libemoji

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-sonyericsson \
    ro.com.google.clientidbase.ms=android-sonymobile \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.gmsversion=4.4_r1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Extra file systems
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

