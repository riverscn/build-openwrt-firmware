#!/bin/bash

OPENWRT_ARMVIRT="$(pwd)/bin/openwrt-armvirt-64-default-rootfs.tar.gz"
PACKAGE_SOC="s905d"
KERNEL_VERSION_NAME="5.4.142"
OPENWRT_VER="immortal21.02"
WHOAMI="river"

KERNEL_VERSION_ORIG="$(awk '/kernel/ {print $3}' $(pwd)/openwrt/bin/targets/*/*/*.manifest | awk -F '-' '{print $1}' | awk 'NR==1')"

rename -f 's/immortalwrt/openwrt/' bin/*.*.gz
rename -f "s/sysupgrade/${OPENWRT_VER}_k${KERNEL_VERSION_ORIG}/" bin/*.img.gz
rename -f "s/combined/combined-${OPENWRT_VER}_k${KERNEL_VERSION_ORIG}/" bin/*.img.gz

rm bin/*rpi*factory.img.gz
rm bin/*rootfs.img.gz
rm bin/*ext4*.img.gz

source openwrt_flippy.sh
