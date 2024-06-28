FROM mcr.microsoft.com/devcontainers/base:dev-ubuntu-20.04

### 以下为基础镜像的构建命令，请不要改动

# 设置工作目录
# WORKDIR /workspaces/project

# 环境变量设置
# ENV DEBIAN_FRONTEND=noninteractive
# ENV TZ Asia/Shanghai
# ENV LESSCHARSET=utf-8

# 安装基本工具
# 更改软件源为阿里云的源
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
#     && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
#     && apt-get update && apt-get install -y \
#     build-essential git net-tools wget sudo && \
#     apt-get autoremove -y && \
#     rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# 创建用户，容器启动挂载文件时id为1000
# ENV USERNAME=superide
# ARG USER_UID=1000
# ARG USER_GID=1000
# RUN groupadd -g $USER_GID $USERNAME \
#     && useradd -rm -d /home/$USERNAME -s /bin/bash -u $USER_UID -g $USER_GID $USERNAME \
#     && echo "$USERNAME:123456" | chpasswd && usermod -aG sudo $USERNAME && chmod g+rw /home 

# 复制示例项目并更改权限
# COPY ../ /workspaces/exampleProject/
# RUN rm -rf /workspaces/exampleProject/.devcontainer /workspaces/exampleProject/.git \
#     && chown -R superide /workspaces 

### 以下为制作容器镜像时需要修改的区域
# # 环境变量设置
# ENV VARIABLE=new_value

# # 安装基本工具
# RUN apt-get install packageName


# # 切换到普通用户
# USER superide
