#!/bin/bash

RUST_PATH="/opt/cybertools/rust/lang"
TOOLCHAIN="$(uname -m)-unknown-linux-gnu"
TOOLCHAIN_VERSION="1.78.0"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run this as root idiot!"
    exit 1
fi

rm -rf $RUST_PATH

RUSTUP_INIT_SKIP_PATH_CHECK=yes \
CARGO_HOME=$RUST_PATH \
RUSTUP_HOME=$RUST_PATH \
sh rustup-init.sh -y --default-host "$TOOLCHAIN" --default-toolchain=$TOOLCHAIN_VERSION || exit 1

chown -R "$SUDO_USER:sudo" $RUST_PATH
