# 《庖丁解牛Linux内核分析》二维码对应资料内容

*   	封面二维码：
《庖丁解牛Linux内核分析》免费配套资料：在线实验环境https://www.shiyanlou.com/courses/195 收费相关资料：75折购书https://j.youzan.com/pfzVI9 Linux网络核心专栏文章http://blog.51cto.com/cloumn/detail/32 慕课视频 http://mooc.study.163.com/course/1000072000
*   	二维码1	：
2013年计算机操作系统原理https://github.com/mengning/mykernel/wiki/OS2013
*   	二维码2	：
mykernel项目github主页https://github.com/mengning/mykernel 自己动手写一个操作系统内核【内含视频】
https://mp.weixin.qq.com/s/SzpN1BNty5aPDZhNdCO5yA
*   	二维码3	：
kernel-in-kernel项目github主页https://github.com/jserv/kernel-in-kernel
*   	二维码4	：
实验楼邀请注册网址http://www.shiyanlou.com/register?inviter=NTY0MzE5MDMxOTc2
*   	二维码5	：
《庖丁解牛Linux内核分析》配套线上实验环境https://www.shiyanlou.com/courses/195
*   	二维码6	：
github网址https://github.com gitee网址https://gitee.com
*   	二维码7	：
linux-3.9.4源代码压缩包https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.9.4.tar.xz
*   	二维码8	：
mykernel_for_linux3.9.4sc.patch补丁文件https://raw.github.com/mengning/mykernel/master/mykernel_for_linux3.9.4sc.patch
*   	二维码9	：
mykernel项目github主页
https://github.com/mengning/mykernel
*   	二维码10	：
Linux内核官方网站
https://www.kernel.org/
*   	二维码11	：
linux-3.18.6源代码压缩包
https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.6.tar.xz
*   	二维码12	：
menu项目github主页
https://github.com/mengning/menu
*   	二维码13	：
menu项目git版本库
https://github.com/mengning/menu.git
*   	二维码14	：
start_kernel函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/init/main.c#L500
*   	二维码15	：
kernel_thread函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/init/main.c#L403
*   	二维码16	：
kthreadd函数https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/kthread.c#L483
*   	二维码17	：
《软件工程C编码实践篇》的课程
http://mooc.study.163.com/course/1000002006?share=2&shareId=1000001002#/info
*   	二维码18	：
系统调用列表https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/syscalls/syscall_32.tbl
*   	二维码19	：
system_call汇编代码https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/kernel/entry_32.S#L490
*   	二维码20	：
设置系统调用中断向量0x80 https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/kernel/traps.c#L838
*   	二维码21	：
SYSCALL_VECTOR宏定义https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/include/asm/irq_vectors.h#L49
*   	二维码22	：
syscall_exit_work需要跳转到work_pending，里面有work_notifysig处理信号，还有work_resched是需要重新调度，这里是进程调度的时机点call schedule，调度完之后就会跳转到restore_all恢复现场返回系统调用到用户态。https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/kernel/entry_32.S#L593
*   	二维码23	：
Linux内核中用一个数据结构 struct task_struct来描述进程https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/sched.h#L1235
*   	二维码24	：
Linux内核中描述的所有的进程状态的宏定义https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/sched.h#L203
*   	二维码25	：
进程的标识符PID https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/sched.h#L1330
*   	二维码26	：
struct list_head数据结构https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/types.h#L186
*   	二维码27	：
Linux内核第一个进程的初始化，其中的init_task即为第一个进程（0号进程）的进程描述符结构体变量，它的初始化是通过硬编码方式固定下来的，除此之外所有其他进程的初始化都是通过do_fork复制父进程的方式初始化的。
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/init/main.c#L510
*   	二维码28	：
init_task进程描述符的初始化代码
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/init/init_task.c#L18
*   	二维码29	：
INIT_TASK宏定义，0号进程的初始化https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/init_task.h#L173
*   	二维码30	：
struct thread_struct数据结构https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/include/asm/processor.h#L468
*   	二维码31	：
创建进程相关的几个系统调用内核处理函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/fork.c#L1693
*   	二维码32	：
do_fork函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/fork.c#L1617
*   	二维码33	：
clone_flags：子进程创建相关标志，通过此标志可以对父进程的资源进行有选择的复制https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/uapi/linux/sched.h#L4
*   	二维码34	：
copy_process()函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/fork.c#L1174
*   	二维码35	：
dup_task_struct函数
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/fork.c#L305
*   	二维码36	：
thread_info结构体 https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/include/asm/thread_info.h#L26
*   	二维码37	：
thread_union联合体 https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/include/linux/sched.h#L2241
*   	二维码38	：
copy_thread函数代码https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/arch/x86/kernel/process_32.c#L132
*   	二维码39	：
目标文件一般也叫ABI（Application Binary Interface，应用程序二进制接口）
https://en.wikipedia.org/wiki/Object_file
*   	二维码40	：
系统调用内核处理函数sys_execve()
https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/fs/exec.c#L1604
*   	二维码41	：
连续发生故障(double fault)
https://en.wikipedia.org/wiki/Double_fault
*   	二维码42	：
schedule函数https://github.com/torvalds/linux/blob/b2776bf7149bddd1f4161f14f79520f17fc1d71d/kernel/sched/core.c#L2860
