#!/bin/bash -e

rm -rf bin/ 2> /dev/null
mkdir bin

if [ -z "$1" or "$1" != "all" ]
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
                if [ "$1" = "actions" ]; then make clean; fi
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


