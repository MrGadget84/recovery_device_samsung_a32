#!/bin/bash
# AERA packaging options for Samsung Galaxy A32 4G (a32).
FDEVICE="a32"

aera_get_target_device() {
    local chkdev
    chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    if [ -n "$chkdev" ]; then
        AERA_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        [ -n "$chkdev" ] && AERA_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" ] && [ -z "$AERA_BUILD_DEVICE" ]; then
    aera_get_target_device
fi

if [ "$1" = "$FDEVICE" ] || [ "$AERA_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"
    export AERA_USE_TAR_BINARY=1
    export AERA_USE_SED_BINARY=1
    export AERA_USE_GREP_BINARY=1
    export AERA_USE_DATE_BINARY=1
    export AERA_USE_BUSYBOX_BINARY=1
    export AERA_USE_LZ4_BINARY=1
    export AERA_USE_XZ_UTILS=1
    export AERA_USE_UPDATED_MAGISKBOOT=1
    export AERA_USE_FSCK_EROFS_BINARY=1
    export AERA_VANILLA_BUILD=1
    export AERA_PRODUCT_PREFIX="AERA"
    export AERA_BUILD_STATUS="Unofficial"
    export AERA_BUILD_TYPE="Beta"
    export AERA_TARGET_DEVICES="SM-A325F"
    export AERA_SETTINGS_ROOT_DIRECTORY="/data/recovery"
    export AERA_MISCELLANEOUS_ROOT_DIRECTORY="/sdcard"
    unset AERA_AB_DEVICE
    unset AERA_VIRTUAL_AB_DEVICE
    unset AERA_MAINTAINER_PATCH_VERSION
fi
