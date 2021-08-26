#!/bin/bash
COMMON_SEED="configs/custom.seed"
CONFIG_FILE="openwrt/.config"

rm -f $CONFIG_FILE 2> /dev/null
(. $1)
cat $COMMON_SEED >> $CONFIG_FILE
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
cat .config