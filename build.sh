#!/bin/bash

## This script is for build openwrt locally on your computer

PREPARE_SCRIPT="prepare_env.sh"
FETCH_OPENWRT_SCRIPT="fetch_openwrt.sh"
COMPILE_OPENWRT_SCRIPT="compile_openwrt.sh"
PACK_FIRMWARE_SCRIPT="pack_firmware.sh"
PACKAGED_OUTPUTPATH="/opt/openwrt_packit/tmp"

(. ${PREPARE_SCRIPT})
(. ${FETCH_OPENWRT_SCRIPT})
(. ${COMPILE_OPENWRT_SCRIPT})

if [ "$1" = "arm64-openwrt" ]; then
    # Pack Other SBC Boxes' firmware
    wget -O openwrt_flippy.sh https://github.com/unifreq/openwrt_packit/raw/master/openwrt_flippy.sh
    sudo bash ${PACK_FIRMWARE_SCRIPT}
    sudo mv ${PACKAGED_OUTPUTPATH}/*.img.gz bin/
fi