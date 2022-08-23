#!/bin/bash

(git clone https://github.com/immortalwrt/immortalwrt -b master openwrt) || (cd openwrt && git stash && git pull)

cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a
