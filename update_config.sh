#!/bin/bash
COMMON_SEED="configs/custom.seed"
CONFIG_FILE="openwrt/.config"

rm -f $CONFIG_FILE 2> /dev/null
(. $1)
cat $COMMON_SEED >> $CONFIG_FILE

cd openwrt
make defconfig
cat .config