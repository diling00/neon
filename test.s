.data
msg: .ascii "Hello, ARM World!\n"
len = . - msg
fmt: .asciz "The number is: %d\n"

.text

.globl main

.extern printf

main:
#push {ip, lr}
sub %sp, $128
mov %r4, %sp

vmov.i8 %d2, $2
vmov.i8 %d3, $3
vmull.s8 %q0, %d2, %d3
vst1.32 {d0-d1}, [r4]

ldr %r0, =fmt
#mov %r1, $1024
ldrh %r1, [r4]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $2]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $4]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $6]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $8]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $10]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $12]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $14]
bl printf

ldr %r0, =fmt
ldrh %r1, [r4, $16]
bl printf


/* write syscall */
mov %r0, $1 
ldr %r1, =msg 
ldr %r2, =len 
mov %r7, $4 
swi $0 

/* exit syscall */
mov %r0, $0 
mov %r7, $1 
swi $0
