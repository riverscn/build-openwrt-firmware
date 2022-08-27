#!/bin/bash

(git clone https://github.com/immortalwrt/immortalwrt openwrt) || (cd openwrt && git stash && git pull)

cd openwrt

(git clone https://github.com/xiaorouji/openwrt-passwall2 ./packages/openwrt-passwall2) || (cd ./package/lean && git stash && git pull && cd ../.. )

./scripts/feeds update -a
./scripts/feeds install -a
