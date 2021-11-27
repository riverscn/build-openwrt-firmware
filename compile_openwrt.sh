#!/bin/bash

exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
        exit $exit_code
    fi
}

OPENWRT_VER="immortal21.02"

PACK_FIRMWARE_SCRIPT="pack_firmware.sh"
PACKAGED_OUTPUTPATH="/opt/openwrt_packit/tmp"

rm -rf bin/ 2> /dev/null
mkdir bin
mkdir bin/tmp

for FILE in $@
    do
      if [ ! -f "$FILE" ]; then
        echo "$FILE does not exist."
        exit 1
      fi
      echo "Free space:"
      df -h
      echo "Compiling: ${FILE}"
      CONFIG_NAME=
      USE_FLIPPY_KERNEL=
      source update_config.sh ${FILE}
      echo CONFIG_NAME=${CONFIG_NAME} USE_FLIPPY_KERNEL=${USE_FLIPPY_KERNEL}
      cd openwrt
      make download -j8
      make -j$(nproc) || make -j1 V=s
      mv bin/targets/*/*/*.*.gz ../bin/tmp
      # if [ "$(df --output=avail -h $(pwd) | sed '1d;s/[^0-9]//g')" -lt "20" ]; then make dirclean; fi
      cd ..
      rename -f "s/immortalwrt/openwrt/" bin/tmp/*.*.gz
      rm bin/tmp/*rpi*factory.img.gz 2> /dev/null
      rm bin/tmp/*rootfs.img.gz 2> /dev/null
      rm bin/tmp/*ext4*.img.gz 2> /dev/null

      if [ "$USE_FLIPPY_KERNEL" = "1" ]; then
        # Pack Other SBC Boxes' firmware
        wget -O openwrt_flippy.sh https://github.com/unifreq/openwrt_packit/raw/master/openwrt_flippy.sh
        sudo bash ${PACK_FIRMWARE_SCRIPT}
        sudo mv ${PACKAGED_OUTPUTPATH}/*.img.gz bin/tmp/
        rename -f "s/.img.gz/${CONFIG_NAME}.img.gz/" bin/tmp/*.img.gz
      else
        KERNEL_VERSION_ORIG="$(awk '/kernel/ {print $3}' $(pwd)/openwrt/bin/targets/*/*/*.manifest | awk -F '-' '{print $1}' | awk 'NR==1')"
        rename -f "s/.img.gz/-${OPENWRT_VER}_k${KERNEL_VERSION_ORIG}${CONFIG_NAME}.img.gz/" bin/tmp/*.img.gz
      fi
      mv bin/tmp/*.img.gz bin/
    done
rm bin/tmp/ -r
