#!/bin/bash

## This script is for build openwrt locally on your computer

CONFIG_SCRIPTS=$1

echo Build: ${CONFIG_SCRIPTS}

PREPARE_SCRIPT="prepare_env.sh"
FETCH_OPENWRT_SCRIPT="fetch_openwrt.sh"
COMPILE_OPENWRT_SCRIPT="compile_openwrt.sh"

bash ${PREPARE_SCRIPT}
bash ${FETCH_OPENWRT_SCRIPT}
bash ${COMPILE_OPENWRT_SCRIPT} ${CONFIG_SCRIPTS}

ls bin/