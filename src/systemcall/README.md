# time as a systemcall example

```
gcc -o time-asm time-asm.c
gcc -o time time.c
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc -o time time.c -m32
```

* 
```
gcc -o time time.c -static
objdump -S time > time64.S
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc -o time time.c -static -m32
objdump -S time > time32.S
```
