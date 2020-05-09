# time as a systemcall example

```
gcc -o time-asm time-asm.c
gcc -o time time.c
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc -o time time.c -m32
```

* time.s 
```
gcc -S -o time.s time.c
```
* time.S
```
gcc -S -o time.s time.c -static
```
* time32.s 
```
gcc -S -o time.s time.c -m32
```
