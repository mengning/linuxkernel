#!/bin/bash

# 
# Build a Linux system with Alpine mini rootfs
# Copyright (c) Mengning Software. 2024. All rights reserved.
# mengning997@163.com
# 

# 更改软件源为阿里云的源
# sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
# sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
# # 更新软件源列表并下载开发工具
# apt-get update && apt list --upgradable\
#     && apt-get install -y global build-essential qemu qemu-system-x86 libncurses5-dev bison flex libssl-dev libelf-dev git wget bc cpio python gdb

LINUX_VERSION=linux-5.4.34
BUSYBOX_VERSION=busybox-1.36.1
ALPINE_LINUX_MINI_ROOTFS=alpine-minirootfs-3.19.1-x86_64

# download ${LINUX_VERSION} & config & make
if [ -f "./${LINUX_VERSION}.tar.xz" ]; then
    echo "${LINUX_VERSION}.tar.xz文件存在"
else
    echo "${LINUX_VERSION}.tar.xz downloading ..."
    wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/${LINUX_VERSION}.tar.xz
fi

if [ -d "../${LINUX_VERSION}" ]; then
    echo "../${LINUX_VERSION} 目录存在"
else
    xz -d ${LINUX_VERSION}.tar.xz
    tar -xvf ${LINUX_VERSION}.tar -C .. # 如果项目在Windows文件系统里内核编译会出错
    ln -s ../${LINUX_VERSION} ${LINUX_VERSION}
fi

# 默认配置内核
(cd ./${LINUX_VERSION} && make defconfig)

# Processor type and features ---->
#   [] Randomize the address of the kernel image (KASLR)

# Kernel hacking --->
#       Compile-time checks and compiler options --->
#           [*] Compile the kernel with debug info
#           [*] Provide GDB scripts for kernel debugging
#   [*] Kernel debugging
 
# (cd ${LINUX_VERSION} && make menuconfig)

# 编译内核
(cd ./${LINUX_VERSION} && make -j$(nproc))

# download Alpine mini rootfs
if [ -f "./${ALPINE_LINUX_MINI_ROOTFS}.tar.gz" ]; then
    echo "${ALPINE_LINUX_MINI_ROOTFS}.tar.gz文件存在"
else
    echo "${ALPINE_LINUX_MINI_ROOTFS}.tar.gz downloading ..."
    wget -c https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-minirootfs-3.19.1-x86_64.tar.gz
fi

if [ -d "../${ALPINE_LINUX_MINI_ROOTFS}" ]; then
    echo "../${ALPINE_LINUX_MINI_ROOTFS} 目录存在"
else
    mkdir ../${ALPINE_LINUX_MINI_ROOTFS}
    tar -zxvf ${ALPINE_LINUX_MINI_ROOTFS}.tar.gz -C ../${ALPINE_LINUX_MINI_ROOTFS}
    ln -s ../${ALPINE_LINUX_MINI_ROOTFS} rootfs
fi

# make rootfs
cp -a init ./rootfs 
(cd rootfs && chmod +x init &&   \
    # cp -a /dev/{null,tty} dev/ && \
         find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../kerneldebuging/rootfs.img)

# 生成 compile_commands.json
(cd linux-5.4.34/ && python scripts/gen_compile_commands.py)