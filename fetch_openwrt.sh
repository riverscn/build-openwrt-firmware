#!/bin/bash

(git clone -b master --single-branch https://github.com/immortalwrt/immortalwrt openwrt) || (cd openwrt && git stash && git pull)

cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a
