# Common SuperNexus overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/supernexus/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/supernexus/overlay/dictionaries

# Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.supernexus.superuser

# Common product property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Enable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Enable ADB authentication
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/supernexus/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# init.d support
PRODUCT_COPY_FILES += \
    vendor/supernexus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/supernexus/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/supernexus/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SuperNexus-specific init file
PRODUCT_COPY_FILES += \
    vendor/supernexus/prebuilt/common/etc/init.local.rc:root/init.sn.rc

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/supernexus/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# Required SuperNexus Packages
PRODUCT_PACKAGES += \
    SoundRecorder \
    Basic \
    Launcher3 \
    libemoji

# OpenSSH
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    bash \
    nano \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Live wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable

# VideoEditor
PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

# Superuser & Busybox
PRODUCT_PACKAGES += \
    Busybox \
    Superuser \
    su

# Enable root for Apps + ADB 
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3

# Inherit common SuperNexus SELinux Policies
-include vendor/supernexus/sepolicy/sepolicy.mk

# Inherit common product build prop overrides
-include vendor/supernexus/configs/common_versions.mk