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
<<<<<<< HEAD
gcc -o time time.c -static
objdump -S time > time64.S
# 64位机器上编出32位代码需加-m32
sudo apt-get install gcc-multilib
gcc -o time time.c -static -m32
objdump -S time > time32.S
=======
gcc -S -o time.s time.c
```
* time.S
```
gcc -S -o time.S time.c -static
```
* time32.s 
```
gcc -S -o time32.s time.c -static -m32
>>>>>>> 1cf0e6f4c6f27088c78a7578c7cb13d90b49618f
```
