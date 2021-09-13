# assembly example code 

## Build Commands

```
gcc –S –o assembly.s assembly.c
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc –S –o assembly.s assembly.c –m3
# openEuler(鲲鹏处理器)
gcc -S -o assembly_aarch64.s assembly.c
# Ubuntu（x86）交叉编译
sudo apt-get install gcc-aarch64-linux-gnu
aarch64-linux-gnu-gcc -S -o assembly_aarch64.s assembly.c
```


