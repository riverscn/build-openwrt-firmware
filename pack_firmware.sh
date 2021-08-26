#!/bin/bash

OPENWRT_ARMVIRT="$(pwd)/openwrt/bin/targets/armvirt/64/*.tar.gz"
PACKAGE_SOC="all"
KERNEL_VERSION_NAME="5.4.142"
OPENWRT_VER="immortal21.02"
WHOAMI="river"

cd openwrt
rename -f 's/immortalwrt/openwrt/' bin/targets/*/*/*.img.gz
rename -f "s/sysupgrade/${OPENWRT_VER}/" bin/targets/*/*/*.img.gz
rm bin/targets/*/*/*factory.img.gz
cd..

git clone https://github.com/unifreq/openwrt_packit.git || cd openwrt_packit && git stash && git pull && cd ..
cd openwrt_packit
source openwrt_flippy.sh
