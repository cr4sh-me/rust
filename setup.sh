#!/bin/bash

TOOLCHAIN="$(uname -m)-unknown-linux-gnu"
TOOLCHAIN_VERSION="1.78.0"

rm -rf "$HOME/.cargo" "$HOME/.rustup"
sh rustup-init.sh -y --default-host "$TOOLCHAIN" --default-toolchain=$TOOLCHAIN_VERSION || exit 1
