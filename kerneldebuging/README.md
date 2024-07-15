# VS Code调试Linux内核环境

## Ubuntu 20.04 Linux主机/虚拟机或WSL环境下使用说明

在Linux终端命令行上执行如下：

    ```
    git clone https://gitee.com/mengning997/linuxkernel.git
    cd linuxkernel/kerneldebuging
    sudo ./auto-tasks.sh
    # 执行如下命令会弹出QEMU窗口运行Linux内核+Alpine mini rootfs系统
    qemu-system-x86_64 -kernel linux-5.4.34/arch/x86/boot/bzImage -initrd rootfs.img
    # 纯命令行下启动虚拟机
    qemu-system-x86_64 -kernel linux-5.4.34/arch/x86/boot/bzImage -initrd rootfs.img -nographic -append "console=ttyS0"
    ...
    [    2.650661] Write protecting the kernel read-only data: 20480k
    [    2.653933] Freeing unused kernel image memory: 2004K
    [    2.655225] Freeing unused kernel image memory: 860K
    [    2.655516] Run /init as init process
                --------------------               
                                                    
                Wellcome MengningOS!               
                                                    
                --------------------               
    /home #
    ```
## 在Dev Container容器环境下使用说明

1. Windows下安装 Docker Desktop

2. 自主安装 Git 、VS Code, 并在 VS Code 中安装 Dev Container 插件。

3. 克隆本仓库，在VS Code中打开项目，然后点击左下角远程开发，选择在容器中重新打开；最后在Terminal中执行：

    ```
    cd ~
    git clone https://gitee.com/mengning997/linuxkernel.git # 注意：如果要编译Linux内核一定要在Linux文件系统环境下，克隆到Windows文件系统下编译过程中会有问题！
    cd linuxkernel/kerneldebuging
    sudo apt-get update
    sudo apt-get install -y global build-essential qemu qemu-system-x86 libncurses5-dev bison flex libssl-dev libelf-dev git wget bc cpio python gdb
    make
    ...
    [    2.650661] Write protecting the kernel read-only data: 20480k
    [    2.653933] Freeing unused kernel image memory: 2004K
    [    2.655225] Freeing unused kernel image memory: 860K
    [    2.655516] Run /init as init process
                --------------------               
                                                    
                Wellcome MengningOS!               
                                                    
                --------------------               
    /home #
    ```

## 调试Linux内核

4. 为了调试重新配置内核选项。

    ```
    make defconfig # Default configuration is based on 'x86_64_defconfig'
    make menuconfig
    # 打开debug相关选项
    Kernel hacking  --->
        Compile-time checks and compiler options  --->
            [*] Compile the kernel with debug info
            [*]   Provide GDB scripts for kernel debugging
     [*] Kernel debugging
    # 关闭KASLR，否则会导致打断点失败
    Processor type and features ---->
        [] Randomize the address of the kernel image (KASLR)
    ```

5. 重新编译内核。

    ```
    make -j$(nproc)
    ```
6. VS Code调试内核

todo: .vscode/launch.json中的preLaunchTask一直处于启动过程中，似乎没有调用起来gdb？

* 手工启动Terminal -> Run task... 选择"run MengningOS as Debug mode"
* 然后F5启动调试


7. 命令行模式调试内核

* 启动内核命令

    ```
    qemu-system-x86_64 -kernel linux-5.4.34/arch/x86/boot/bzImage -initrd rootfs.img -S -s
    # 纯命令行下启动虚拟机
    qemu-system-x86_64 -kernel linux-5.4.34/arch/x86/boot/bzImage -initrd rootfs.img -S -s -nographic -append "console=ttyS0"
    ```
* 启动gdb
    ```
    gdb linux-5.4.34/vmlinux
    (gdb) target remote:1234
    (gdb) b start_kernel
    (gdb) c、bt、list、next、step....
    ```

### 参考 

* https://gitee.com/mengning997/linuxkerneldebug
* [Linux源码阅读、编译调试和启动过程.pptx](https://gitee.com/mengning997/linuxkernel/raw/master/ppt/3-Linux%E6%BA%90%E7%A0%81%E9%98%85%E8%AF%BB%E3%80%81%E7%BC%96%E8%AF%91%E8%B0%83%E8%AF%95%E5%92%8C%E5%90%AF%E5%8A%A8%E8%BF%87%E7%A8%8B.pptx)
