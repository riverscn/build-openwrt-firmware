#!/bin/bash

## This script is for build openwrt locally on your computer

PREPARE_SCRIPT="prepare_env.sh"
FETCH_OPENWRT_SCRIPT="fetch_openwrt.sh"
COMPILE_OPENWRT_SCRIPT="compile_openwrt.sh"
OPENWRT_VER="Immortal21.02"
PACKAGED_OUTPUTPATH="/opt/openwrt_packit/tmp"

(. ${PREPARE_SCRIPT})
(. ${FETCH_OPENWRT_SCRIPT})
(. ${COMPILE_OPENWRT_SCRIPT})

# Pack Other SBC Boxes' firmware
(
    sudo bash ./pack_firmware.sh
)

# COPY bin files
(
    sudo mv ${PACKAGED_OUTPUTPATH}/* bin/
    mv openwrt/bin/targets/*/*/*.img.gz bin/
)