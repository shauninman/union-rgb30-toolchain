FROM ubuntu:22.04

RUN apt -y update && apt -y install \
	autoconf \
	bc \
    build-essential \
    bzip2 \
	bzr \
	cmake \
	cmake-curses-gui \
	cpio \
	git \
	libncurses5-dev \
	locales \
	make \
	rsync \
	scons \
	tree \
	unzip \
	wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /work
RUN mkdir -p /root && mkdir -p /root/workspace

WORKDIR /work

COPY support .
RUN ./setup-toolchain.sh

VOLUME /root/workspace
WORKDIR /root/workspace

ENV PATH="/work/MOSS/build.MOSS-RK3566.aarch64/toolchain/usr/bin:${PATH}:/work/MOSS/build.MOSS-RK3566.aarch64/toolchain/aarch64-libreelec-linux-gnueabi/sysroot/bin"
ENV CROSS_COMPILE=/work/MOSS/build.MOSS-RK3566.aarch64/toolchain/bin/aarch64-libreelec-linux-gnueabi-
ENV PREFIX=/work/MOSS/build.MOSS-RK3566.aarch64/toolchain/aarch64-libreelec-linux-gnueabi/sysroot/usr
ENV UNION_PLATFORM=rgb30

CMD ["/bin/bash"]