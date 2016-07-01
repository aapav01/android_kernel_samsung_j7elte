

export ARCH=arm64
export CROSS_COMPILE=~/working/kernel/linaro-5.3-64/bin/aarch64-linux-android-
mkdir -p output

make -C $(pwd) O=output exynos7580-turbo-j7elte_defconfig

mkdir -p output/init
cp -vf init/vmm.elf output/init/vmm.elf

make -C $(pwd) O=output -j10

./tools/dtbtool -s 2048 -o output/dt.img -p scripts/dtc/ output/arch/arm64/boot/dts/
