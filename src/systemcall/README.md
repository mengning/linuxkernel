# time as a systemcall example

```
gcc -o time-asm time-asm.c
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc -o time time.c -m32
```
