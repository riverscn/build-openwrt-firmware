#!/bin/bash

## This script is for build openwrt locally on your computer

PREPARE_SCRIPT="prepare_env.sh"
FETCH_OPENWRT_SCRIPT="fetch_openwrt.sh"

(. "$PREPARE_SCRIPT")
(. "$FETCH_OPENWRT_SCRIPT")

# Raspberry Pi 4
(
    bash update_config.sh configs/bcm2711-raspi4-openwrt.sh
    cd openwrt
    make download -j8
    make -j$(nproc) || make -j1 V=s
    rename -f 's/immortalwrt/openwrt/' bin/targets/bcm27xx/bcm2711/*.img.gz
)

# Other SBC Boxes
(
    bash update_config.sh configs/arm64-openwrt.sh
    cd openwrt
    make download -j8
    make -j$(nproc) || make -j1 V=s
    rename -f 's/immortalwrt/openwrt/' bin/targets/armvirt/64/*.tar.gz
)

# Pack Other SBC Boxes' firmware
(
    git clone https://github.com/unifreq/openwrt_packit.git || cd openwrt_packit && git stash && git pull && cd ..
    cd openwrt_packit

    OPENWRT_ARMVIRT="../openwrt/bin/targets/armvirt/64/*.tar.gz"
    PACKAGE_SOC="all"
    KERNEL_VERSION_NAME="5.4.142"
    OPENWRT_VER="Immortal21.02"
    WHOAMI="river"
    
    . openwrt_flippy.sh
)
