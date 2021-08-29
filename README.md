# Build Openwrt firmware with ease
Scripts for building openwrt router box firmware.

[下载最新固件](https://github.com/riverscn/build-openwrt-firmware/releases)

[使用方法及相关测试](https://blog.lishun.me/openwrt-mega-post)

[![Build OpenWrt Firmware](https://github.com/riverscn/build-openwrt-firmware/actions/workflows/BUILD_CI.yml/badge.svg)](https://github.com/riverscn/build-openwrt-firmware/actions/workflows/BUILD_CI.yml)

# Default hardware targets

* X86
* Raspberry Pi 4 Series
* Phicomm N1

You can [add your own target config](configs).

# Features

* Use [Immortalwrt](https://github.com/immortalwrt/immortalwrt) source, which makes things easier.
* Use Openwrt 21.02 branch.
* For TV boxes, use [unifreq's script](https://github.com/unifreq/openwrt_packit/blob/master/README.ACTION.md) and [flippy's kernel](https://github.com/breakings/OpenWrt/tree/main/opt/kernel) (pre-compiled), which makes things better.
* Enable IPv6 compatibility by default.
* Enable Flow Offloading and Full Cone NAT by default.
* Enable WiFi by default. You can turn it off to achieve lower temperature.
* Enable USB Ethernet and Storage support.
* You can [fork this repo](https://github.com/riverscn/build-openwrt-firmware/generate) and make your own [package config](configs). It's very easy.

# Pre-installed packages

## Common

* luci-app-passwall
* luci-app-udpxy
* luci-app-upnp
* luci-theme-argon
* luci-app-zerotier

## Only for main router (x86)

* luci-app-acme
* luci-app-iptvhelper
* luci-app-mwan3
* luci-app-omcproxy
* luci-app-sqm

# Build your own firmwares

## Build online

[fork this repo](https://github.com/riverscn/build-openwrt-firmware/generate) and create Github Actions workflow!

## Build locally

Alternatively, you can build openwrt on your own computer. Ubuntu or Debian is supported.

Be ware: if you use Docker for Windows, [unifreq's script](https://github.com/unifreq/openwrt_packit/blob/master/README.ACTION.md) may not work correctly. You can use a Virtual Machine instead.

Run `./build.sh` to build all targets.
Run `./build.sh configs/xxxx-openwrt.sh` to build one target.
