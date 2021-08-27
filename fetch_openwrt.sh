#!/bin/bash

(git clone -b openwrt-21.02 --single-branch https://github.com/immortalwrt/immortalwrt openwrt) || (cd openwrt && git stash && git pull)

./scripts/feeds update -a
./scripts/feeds install -a