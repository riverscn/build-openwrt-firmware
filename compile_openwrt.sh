#!/bin/bash -e

rm -rf bin/ 2> /dev/null
mkdir bin

if [[ -z "$1" ]] || [[ "$1" != "all" ]]
  then
    for FILE in ./configs/*-openwrt.sh
        do
            (
                echo "Free space:"
                df -h
                echo "Compiling: ${FILE}"
                bash update_config.sh ${FILE}
                cd openwrt
                make download -j8
                make -j$(nproc) || make -j1 V=s
                mv bin/targets/*/*/*.*.gz ../bin/
                if [ "$1" = "all" ]; then make clean; fi
            )
        done
  else
    echo "Free space:"
    df -h
    echo "Compiling: $1"
    bash update_config.sh $1
    cd openwrt
    make download -j8
    make -j$(nproc) || make -j1 V=s
    mv bin/targets/*/*/*.*.gz ../bin/
fi

KERNEL_VERSION_ORIG="$(awk '/kernel/ {print $3}' $(pwd)/openwrt/bin/targets/*/*/*.manifest | awk -F '-' '{print $1}' | awk 'NR==1')"

rename -f 's/immortalwrt/openwrt/' bin/*.*.gz
rename -f "s/sysupgrade/${OPENWRT_VER}_k${KERNEL_VERSION_ORIG}/" bin/*.img.gz
rename -f "s/combined/combined-${OPENWRT_VER}_k${KERNEL_VERSION_ORIG}/" bin/*.img.gz

rm bin/*rpi*factory.img.gz
rm bin/*rootfs.img.gz
rm bin/*ext4*.img.gz

ls bin/