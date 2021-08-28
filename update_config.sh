#!/bin/bash
COMMON_SEED="configs/custom.seed"
CONFIG_SCRIPT="$1"
CONFIG_FILE="openwrt/.config"

rm -f $CONFIG_FILE 2> /dev/null
bash ${CONFIG_SCRIPT}
cat $COMMON_SEED >> $CONFIG_FILE

cd openwrt
make defconfig
cat .config