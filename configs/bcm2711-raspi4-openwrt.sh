#!/bin/bash

cd openwrt

cat >.config <<-EOF
## target
CONFIG_TARGET_bcm27xx=y
CONFIG_TARGET_bcm27xx_bcm2711=y
CONFIG_TARGET_bcm27xx_bcm2711_DEVICE_rpi-4=y

## Raspberry Pi
CONFIG_PACKAGE_bcm27xx-userland=y

## USB Ethernet
CONFIG_PACKAGE_kmod-usb-net-aqc111=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y

## PCIE Ethernet
CONFIG_PACKAGE_kmod-r8169=y

## USB Storage
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y

## USB utils
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb2=y

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
