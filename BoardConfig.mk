#
# Copyright (C) 2018 DevKingsTeam Open-source
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_TREE := device/samsung/treltexx

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := universal5433

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-t760mp6

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/trelte
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CONFIG := trelte_00_defconfig
TARGET_KERNEL_VARIANT_CONFIG := 
KERNEL_TOOLCHAIN_PREFIX := arm-linux-androideabi-
TARGET_PREBUILT_KERNEL := device/samsung/treltexx/zImage

# DTB
TARGET_DTBH_PLATFORM_CODE := 0x000050a6
TARGET_DTBH_SUBTYPE_CODE  := 0x217584da
TARGET_PREBUILT_DTB := $(DEVICE_TREE)/dtb.img

# Boot image
BOARD_KERNEL_CMDLINE := # Exynos doesn't take cmdline arguments from boot image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
# 000RU = recovery kernel, 000KU = system kernel
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --board SYSMAGIC000RU
BOARD_CUSTOM_BOOTIMG_MK :=  $(DEVICE_TREE)/bootimg.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x000E00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x001000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0E1000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x6453FC000 # 0x645400000 - 16384 (crypto footer)
BOARD_CACHEIMAGE_PARTITION_SIZE    := 0x00C800000
BOARD_HIDDENIMAGE_PARTITION_SIZE   := 0x008200000
BOARD_FLASH_BLOCK_SIZE := 0x20000

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/15400000.usb/15400000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/13800000.decon_fb/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_TWRPAPP := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# exFAT drivers included in the kernel
TW_NO_EXFAT_FUSE := true

# No love for the wicked (Android M incompatible)
TW_EXCLUDE_SUPERSU := true

# Encryption support
TW_INCLUDE_CRYPTO := true


# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := false

# Init properties from bootloader version, ex. model info
#TARGET_UNIFIED_DEVICE := true
#TARGET_INIT_VENDOR_LIB := libinit_trelte
#TARGET_RECOVERY_DEVICE_MODULES := libinit_trelte
#TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_TREE)/init/init_trelte.cpp