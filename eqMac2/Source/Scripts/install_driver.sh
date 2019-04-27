#!/bin/sh

# enable install of apps downloaded from anywhere
spctl --master-disable

# remove eqMac 1.0 driver
if [ -d /System/Library/Extensions/eqMacDriver.kext/ ]; then
    kextunload /System/Library/Extensions/eqMacDriver.kext/
    rm -rf /System/Library/Extensions/eqMacDriver.kext/
fi

# remove eqMac < 2.1 driver
if [ -d /System/Library/Extensions/eqMac2Driver.kext/ ]; then
    kextunload /System/Library/Extensions/eqMac2Driver.kext/
    rm -rf /System/Library/Extensions/eqMac2Driver.kext/
fi

touch /System/Library/Extensions

# get current directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install the new driver
cp -R $DIR/eqMac2Driver.kext /System/Library/Extensions/
kextload -tv /System/Library/Extensions/eqMac2Driver.kext
touch /System/Library/Extensions

