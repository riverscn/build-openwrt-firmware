#!/bin/bash

## This script is for build openwrt locally on your computer

PREPARE_SCRIPT="prepare_env.sh"
FETCH_OPENWRT_SCRIPT="fetch_openwrt.sh"
COMPILE_OPENWRT_SCRIPT="compile_openwrt.sh"
PACK_FIRMWARE_SCRIPT="pack_firmware.sh"
PACKAGED_OUTPUTPATH="/opt/openwrt_packit/tmp"

bash ${PREPARE_SCRIPT}
bash ${FETCH_OPENWRT_SCRIPT}
bash ${COMPILE_OPENWRT_SCRIPT} $1

if [ "$1" = "arm64-openwrt" ] || [[ "$1" != "all" ]] || [[ -z "$1" ]]; then
    # Pack Other SBC Boxes' firmware
    wget -O openwrt_flippy.sh https://github.com/unifreq/openwrt_packit/raw/master/openwrt_flippy.sh
    sudo bash ${PACK_FIRMWARE_SCRIPT}
    sudo mv ${PACKAGED_OUTPUTPATH}/*.img.gz bin/
fi

ls bin/