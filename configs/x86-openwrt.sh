#!/bin/bash

cd openwrt

cat >.config <<-EOF
## target
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

## app
CONFIG_PACKAGE_luci-app-acme=y
CONFIG_PACKAGE_luci-app-iptvhelper=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-omcproxy=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_acme-dnsapi=y

EOF
