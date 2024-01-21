#!/bin/bash

# set environment variables
git clone --depth=1 https://github.com/picasso09/clang-9.0.3-r353983c1 clang
export KBUILD_BUILD_HOST="DV-WORK"
export KBUILD_BUILD_USER="picasso09"
export PATH="$(pwd)/clang/bin:$PATH"
export LOCALVERSION="-DiscussionVerse"

# build kernel
make -j$(nproc --all) O=out ARCH=arm64 oppo6765_19451_defconfig
make -j16 ARCH=arm64 O=out \
                      HOSTCC="ccache clang" \
                      HOSTCXX="ccache clang++" \
                      CC="ccache clang" \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi-
