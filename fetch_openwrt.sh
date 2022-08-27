#!/bin/bash

(git clone https://github.com/immortalwrt/immortalwrt openwrt) || (cd openwrt && git stash && git pull)

cd openwrt

(git clone https://github.com/xiaorouji/openwrt-passwall2 package/emortal/openwrt-passwall2) || (cd package/emortal/openwrt-passwall2 && git stash && git pull && cd ../.. )

./scripts/feeds update -a
./scripts/feeds install -a
