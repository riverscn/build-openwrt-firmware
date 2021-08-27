#!/bin/bash

for FILE in ./configs/*-openwrt.sh
do
    (
        echo "Compiling: ${FILE}"
        bash update_config.sh ${FILE}
        cd openwrt
        make download -j8
        make -j$(nproc) || make -j1 V=s
    )
done