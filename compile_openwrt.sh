#!/bin/bash -e

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
        if [ "$1"-e "actions" ]; then make clean; fi
    )
done