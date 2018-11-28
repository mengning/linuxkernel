
# Linux从零入门实战

副标题：做中学：刻意练习最有效的Linux实践之路

用户群： 从零开始成长为Linux开发工程师或运维工程师

课程介绍
本课程以从零开始成长为Linux开发工程师或运维工程师为培养目标进行教学内容组织，从Linux系统安装和基本操作起步、将开发过程中常用的git版本控制、源代码编辑器、Makefile工程文件编写、基本的调试方法和运维中涉及的shell脚本编写、网络基础操作、网络服务的安排配置、网络服务的监控运维有机的结合起来，并深入到Linux系统的构建和Linux内核入门，真正做到从入门到精通，且具有平滑的学习曲线。

适配岗位
Linux开发工程师、Linux运维工程师

学习成果
拥有的自己的git版本库和完整的开发工具环境；
拥有自己的博客网站并进行监控运维
拥有自己构建的Linux系统和自己写的简单操作系统内核

课程特色
做中学动手实战，从零开始，由浅入深，从入门到精通，具有平滑的学习曲线。

第一讲 Linux 介绍
课程介绍
Linux发展简史
Linux 系统安装, 虚拟机 VirtualBox 介绍
Linux 云主机购买
Linux目录结构
基本命令： ls、cd、pwd、cat、mkdir、touch
软件安装与卸载： apt-get
【实战项目】： 使用虚拟机搭建Linux系统环境，配置网络环境

第二讲 Linux常用操作命令

PATH环境变量以及常用快捷键
用户组与用户 
文件属性与权限操作 chmod、chown
find 与 grep：搜索神器find命令基本用法
tar 命令
ssh、 sshd
git 简介
【实战项目】新建hello文件， 推送到 自建的Git 服务器上

第三讲 Linux文件编辑器VIM
VIM的基本用法
Vim的高级用法
VS Code 简介
【实战项目】： 安装Vim 和 VS Code，配置环境，配置或安装插件支持C、shell、Makefile 语法高亮。

第四讲 Linux开发基础
用C语言写一个hello word程序
GCC与GDB 简介
工程文件Makefile
编译安装软件
【实战项目】C语言实现一个支持加、减、乘、除的计算器(包含括号)。

第五讲 Linux Shell编程
Shell脚本入门
Shell脚本的建立和执行
Shell环境变量
Shell局部变量
条件测试
Shell函数
if条件语句
case结构条件句
循环语句(while/until/for)
【实战项目】自动检测Linux系统状况：用户最近登陆日志，CPU，内存，磁盘情况

第六讲 Linux网络基础
计算机网络基础
ifconfig
网络测试命令：主机 ping/ 本机端口：netstat/ 嗅探器 nmap
iptables
【实战项目】Linux 防火墙实战配置：
1、对所有的地址开放本机的80、443、22、8000，8080，8001-8020端口访问；
2、对所有的地址开放ICMP协议的数据包访问；
3、其他未被允许的端口禁止访问
4、使用 nmap 测试结果

第七讲 HTTP网络服务
HTTP基础
LNMP 架构服务搭建
Nginx 配置
MySQL 配置
PHP 简介
【实战项目】： 基于WordPress 搭建个人博客

第八讲 Linux运维基础
Linux系统监控 相关命令：iostat/free/top/dstat/iotop
Linux自化运维
【实战项目】：使用Docker自动部署zabbix运维系统，实时监控服务器性能；

第九讲 Linux系统构建
Linux内核的编译
Linux系统的构建
【实战项目】：下载 Linux 某个版本，自行编译后，在虚拟机中运行起来。

第十讲 Linux操作系统内核入门
Linux内核源代码简介
mykernel项目
【实战项目】：基于Linux编写一个简单的操作系统内核，在虚拟机中运行起来。
