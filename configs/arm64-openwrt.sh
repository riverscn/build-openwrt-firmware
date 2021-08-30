#!/bin/bash

export USE_FLIPPY_KERNEL=1

cd openwrt

packages=" \
brcmfmac-firmware-43430-sdio brcmfmac-firmware-43455-sdio kmod-brcmfmac wpad \
kmod-fs-ext4 kmod-fs-vfat kmod-fs-exfat dosfstools e2fsprogs ntfs-3g \
kmod-usb2 kmod-usb3 kmod-usb-storage kmod-usb-storage-extras kmod-usb-storage-uas \
kmod-usb-net kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 \
blkid lsblk parted fdisk cfdisk losetup resize2fs tune2fs pv unzip \
lscpu htop iperf3 curl lm-sensors python3 autocore-arm libopenssl-afalg
"
sed -i '/FEATURES+=/ { s/cpiogz //; s/ext4 //; s/ramdisk //; s/squashfs //; }' \
    target/linux/armvirt/Makefile
for x in $packages; do
    sed -i "/DEFAULT_PACKAGES/ s/$/ $x/" target/linux/armvirt/Makefile
done

cat >.config <<-EOF
## target
CONFIG_TARGET_armvirt=y
CONFIG_TARGET_armvirt_64=y
CONFIG_TARGET_armvirt_64_Default=y

## for flippy kernel
CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perl-http-date=y
CONFIG_PACKAGE_perlbase-getopt=y
CONFIG_PACKAGE_perlbase-time=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perlbase-utf8=y
CONFIG_PACKAGE_blkid=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_parted=y
CONFIG_PACKAGE_attr=y
CONFIG_PACKAGE_btrfs-progs=y
CONFIG_BTRFS_PROGS_ZSTD=y
CONFIG_PACKAGE_chattr=y
CONFIG_PACKAGE_dosfstools=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_lsattr=y
CONFIG_PACKAGE_mkf2fs=y
CONFIG_PACKAGE_xfs-fsck=y
CONFIG_PACKAGE_xfs-mkfs=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_gawk=y
CONFIG_PACKAGE_getopt=y
CONFIG_PACKAGE_losetup=y
CONFIG_PACKAGE_tar=y
CONFIG_PACKAGE_uuidgen=y
CONFIG_PACKAGE_kmod-brcmfmac=y
CONFIG_BRCMFMAC_SDIO=y
CONFIG_PACKAGE_kmod-brcmutil=y
CONFIG_PACKAGE_kmod-cfg80211=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_hostpad-common=y
CONFIG_PACKAGE_wpa-cli=y
CONFIG_PACKAGE_wpad-basic=y
CONFIG_PACKAGE_iw=y
EOF

cd ..