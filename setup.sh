#!/bin/bash

RUST_PATH="/opt/cybertools/rust/lang"
TOOLCHAIN_VERSION="1.78.0"

TARGET_ARCH="$(uname -m)"

if [ "$TARGET_ARCH" == "aarch64" ]; then
    TOOLCHAIN="aarch64-unknown-linux-gnu"
elif  [ "$TARGET_ARCH" == "armv7l" ]; then
    TOOLCHAIN="armv7-unknown-linux-gnueabihf"
elif [ "$TARGET_ARCH" == "armv6l" ]; then
    TOOLCHAIN="arm-unknown-linux-gnueabihf"
else
    echo "$TARGET_ARCH not supported yet!"
    exit 1
fi

rm -rf $RUST_PATH

RUSTUP_INIT_SKIP_PATH_CHECK=yes \
CARGO_HOME=$RUST_PATH \
RUSTUP_HOME=$RUST_PATH \
sh rustup-init.sh -y --default-host "$TOOLCHAIN" --default-toolchain=$TOOLCHAIN_VERSION || exit 1
