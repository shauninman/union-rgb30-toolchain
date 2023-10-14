#! /bin/sh

# NOTE: I couldn't get relocate.sh to work with this
# so we just have to recreate the original build path
TOOLCHAIN_PATH=MOSS/build.MOSS-RK3566.aarch64
# TODO: download this from github, will probably need to be renamed
TOOLCHAIN_ZIP=toolchain.tar.gz
mkdir -p $TOOLCHAIN_PATH
mv $TOOLCHAIN_ZIP $TOOLCHAIN_PATH
cd $TOOLCHAIN_PATH
tar xf $TOOLCHAIN_ZIP
rm $TOOLCHAIN_ZIP
cd -
rm setup-toolchain.sh