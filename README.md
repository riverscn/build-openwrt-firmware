# Build Openwrt firmware with ease
Scripts for building openwrt router box firmware.

[![Build OpenWrt Firmware](https://github.com/riverscn/openwrt-sbcbox-firmware/actions/workflows/BUILD_CI.yml/badge.svg)](https://github.com/riverscn/openwrt-sbcbox-firmware/actions/workflows/BUILD_CI.yml)

# Features

* Use [Immortalwrt](https://github.com/immortalwrt/immortalwrt) source, which makes things easier.
* Use Openwrt 21.02 branch.
* For TV boxes, use [unifreq's script](https://github.com/unifreq/openwrt_packit/blob/master/README.ACTION.md) and [flippy's kernel](https://github.com/breakings/OpenWrt/tree/main/opt/kernel) (pre-compiled), which makes things better.
* Enable IPv6 compatibility by default.
* Enable Flow Offloading and Full Cone NAT by default.
* Enable WiFi by default. You can turn it off to achieve lower temperature.
* You can fork this repo and make your own [package config](https://github.com/riverscn/openwrt-sbcbox-firmware/blob/main/configs/custom.seed). It's very easy.

# Pre-installed packages

## Common

* luci-app-passwall
* luci-app-udpxy
* luci-app-upnp
* luci-theme-argon
* luci-app-zerotier

## Only for x86

* luci-app-acme
* luci-app-iptvhelper
* luci-app-mwan3
* luci-app-omcproxy
* luci-app-sqm

# Config files

* `custom.seed` is used for common `.config` settings. All targets share these settings.
* `*-openwrt.sh` is used to define each build target. You can create new files to add more targets.

# Build your own firmwares

## Build online

[Fork](https://github.com/riverscn/openwrt-sbcbox-firmware) this repo and create Github Actions workflow!

## Build locally

Alternatively, you can build openwrt on your own computer. Ubuntu or Debian is supported.

You can use Virtual Machine or Docker container. You can use [this one](https://github.com/riverscn/openwrt-dev-container).

Be ware: if you use Docker for Windows, [read this](https://blog.bryanroessler.com/2020-12-14-btrfs-on-wsl2/).

Run `./build.sh` and that's all.
