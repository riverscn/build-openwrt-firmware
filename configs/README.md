# Config files

* [custom.seed](custom.seed) is used for common `.config` settings. All targets share these settings.
* `*-openwrt.sh` is used to define each build target. You can create new files to add more targets.
* [../pack_firmware.sh](../pack_firmware.sh) contains ENV variable [PACKAGE_SOC](https://github.com/unifreq/openwrt_packit/blob/master/README.ACTION.md) to determine what targets to build.
