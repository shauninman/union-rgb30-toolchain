#! /bin/sh

# NOTE: I couldn't get relocate.sh to work with this
# so we just have to recreate the original build path
TOOLCHAIN_PLATFORM=rgb30
TOOLCHAIN_VERSION=v001
TOOLCHAIN_PATH=MOSS/build.MOSS-RK3566.aarch64

TOOLCHAIN_ARCH=`uname -m`
if [ "$TOOLCHAIN_ARCH" = "aarch64" ]; then
	TOOLCHAIN_TAR="$TOOLCHAIN_PLATFORM-toolchain-aarch64.tar.xz"
else
	TOOLCHAIN_TAR="$TOOLCHAIN_PLATFORM-toolchain.tar.xz"
fi
TOOLCHAIN_URL="https://github.com/shauninman/union-$TOOLCHAIN_PLATFORM-toolchain/releases/download/$TOOLCHAIN_VERSION/$TOOLCHAIN_TAR"

mkdir -p "$TOOLCHAIN_PATH"

if [ -f "./$TOOLCHAIN_TAR" ]; then
	cp "./$TOOLCHAIN_TAR" "./$TOOLCHAIN_PATH"
	cd "$TOOLCHAIN_PATH"
	echo "extracting local toolchain ($TOOLCHAIN_ARCH)"
else
	cd "$TOOLCHAIN_PATH"
	echo "getting remote toolchain ($TOOLCHAIN_URL)"
	wget "$TOOLCHAIN_URL"
	echo "extracting remote toolchain $TOOLCHAIN_VERSION ($TOOLCHAIN_ARCH)"
fi
tar xf "./$TOOLCHAIN_TAR"
rm -rf "./$TOOLCHAIN_TAR"
