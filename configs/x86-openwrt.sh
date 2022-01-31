#!/bin/bash

cd openwrt

cat >.config <<-EOF
## target
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

## app
CONFIG_PACKAGE_luci-app-acme=y
CONFIG_PACKAGE_luci-app-iptvhelper=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-omcproxy=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_acme-dnsapi=y

## USB Storage
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y

## USB utils
CONFIG_PACKAGE_usbutils=y

## File System
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-fs-ntfs=y

## Language
CONFIG_PACKAGE_kmod-nls-cp936=y

EOF

cd ..
