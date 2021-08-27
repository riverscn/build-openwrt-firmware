#!/bin/bash

OPENWRT_ARMVIRT="$(pwd)/openwrt/bin/targets/armvirt/64/*.tar.gz"
PACKAGE_SOC="s905d"
KERNEL_VERSION_NAME="5.4.142"
OPENWRT_VER="immortal21.02"
WHOAMI="river"

cd openwrt
rename -f 's/immortalwrt/openwrt/' bin/targets/*/*/*.*.gz
rename -f "s/sysupgrade/${OPENWRT_VER}/" bin/targets/*/*/*.img.gz
rm bin/targets/*/*/*factory.img.gz
cd ..

source openwrt_flippy.sh
