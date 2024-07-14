FROM mcr.microsoft.com/devcontainers/base:dev-ubuntu-20.04

# 安装编译内核所需的工具
RUN apt-get update &&           \
    apt-get upgrade -y &&       \
    apt-get install -y          \
        build-essential         \
        qemu-system-x86         \
        libncurses5-dev         \
        bison                   \
        flex                    \
        libssl-dev              \
        libelf-dev              \
	gdb

CMD ["bash"]
