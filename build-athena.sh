export USE_CCACHE=1
export CCACHE_DIR=/data1/cache
ccache -o compression=true
ccache -M 50G
export ARCH=arm64
export SUBARCH=ARM64

export CC=clang
export CROSS_COMPILE="/home/ubuntu/bin/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-"

echo rm -rf out
echo mkdir out
make O=out ARCH=arm64 clean
make O=out ARCH=arm64 athena-perf_defconfig

make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC="ccache clang" \
                      CROSS_COMPILE=$CROSS_COMPILE




