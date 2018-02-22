as -march=armv8-a+simd  -o test.o test.s
#ld -march=armv8-a+simd  -o test test.o
#ld -o test test.o
gcc -o test test.o
