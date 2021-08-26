#!/bin/bash

cd openwrt_packit

OPENWRT_ARMVIRT="openwrt/bin/targets/armvirt/64/*.tar.gz"
PACKAGE_SOC="all"
KERNEL_VERSION_NAME="5.4.142"
OPENWRT_VER="Immortal21.02"
WHOAMI="river"

source openwrt_flippy.sh

./mk_s905d_n1.sh