#Convert a 32-bit value from Little Endian to Big Endian format using RISC-V assembly

.data 
a: .word 0x12345678
.text
la x10,a
lw x11,0(x10)
addi x13,x13,24
addi x20,x20,4

loop:

andi x14,x11,0xff
sll x16,x14,x13
add x17,x17,x16
srli x11,x11,8
addi x13,x13,-8
addi x20,x20,-1
bne x0,x20,loop

sw x17,4(x10)


#saves 0x10000001 in x10 and 0xfffffff8 in x13 and 0x00000012 in x14 and 0x00000012 in x16 and 0x78563412 in x17


#0x10000004      0x78563412
#0x10000000      0x12345678
