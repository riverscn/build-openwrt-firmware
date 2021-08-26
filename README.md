# Openwrt sbcbox firmware
Actions for build openwrt router box.

# Features

* Use [Immortalwrt](https://github.com/immortalwrt/immortalwrt) source, which makes things easier.
* Use Openwrt 21.02 branch.
* For TV boxes, use [unifreq's script](https://github.com/unifreq/openwrt_packit/blob/master/README.ACTION.md) and [flippy's kernel](https://github.com/breakings/OpenWrt/tree/main/opt/kernel) (pre-compiled), which makes things better.
* Enable IPv6 compatibility by default.
* Enable Flow Offloading and Full Cone NAT by default.
* Enable WiFi by default. You can turn it off to achieve lower temperature.
* You can fork this repo and make your own configs. It's very easy.

# Pre-installed packages

* luci-app-passwall
* luci-app-udpxy
* luci-app-upnp
* luci-theme-argon