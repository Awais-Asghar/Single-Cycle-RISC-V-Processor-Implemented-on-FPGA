   # R-Type

add x1, x2, x3   
add x4, x5, x6  
add x7, x8, x9  
sub x1, x2, x3  
sub x4, x5, x6  
sub x7, x8, x9  
sll x1, x2, x3  
sll x4, x5, x6  
sll x7, x8, x9  
slt x1, x2, x3  
slt x4, x5, x6  
slt x7, x8, x9  
sltu x1, x2, x3  
sltu x4, x5, x6  
sltu x7, x8, x9  
xor x1, x2, x3  
xor x4, x5, x6  
xor x7, x8, x9  
srl x1, x2, x3  
srl x4, x5, x6  
srl x7, x8, x9  
sra x1, x2, x3  
sra x4, x5, x6  
sra x7, x8, x9  
or x1, x2, x3  
or x4, x5, x6  
or x7, x8, x9  
and x1, x2, x3  
and x4, x5, x6  
and x7, x8, x9  

   # I-Type

addi x1, x2, 5  
addi x4, x5, 5  
addi x7, x8, 5  
slti x1, x2, 5  
slti x4, x5, 5  
slti x7, x8, 5  
sltiu x1, x2, 5  
sltiu x4, x5, 5  
sltiu x7, x8, 5  
xori x1, x2, 5  
xori x4, x5, 5  
xori x7, x8, 5  
srli x1, x2, 5  
srli x4, x5, 5  
srli x7, x8, 5  
srai x1, x2, 5  
srai x4, x5, 5  
srai x7, x8, 5  
ori x1, x2, 5  
ori x4, x5, 5  
ori x7, x8, 5  
andi x1, x2, 5  
andi x4, x5, 5  
andi x7, x8, 5  

  # I-Type

lb x1, 0(x2)
lb x3, 4(x5)
lb x6, 8(x8)
lh x1, 0(x2)
lh x3, 3(x5)
lh x6, 4(x8)
lw x1, 0(x2)
lw x3, 4(x5)
lw x6, 5(x8)
lbu x1, 0(x2)
lbu x3, 5(x5)
lbu x6, 2(x8)
lhu x1, 0(x2)
lhu x3, 2(x5)
lhu x6, 6(x8)

   # I-Type
jalr x1, 0(x2)
jalr x3, 4(x5)
jalr x0, 0(x1)

   # S-Type

sb x3, 0(x2)
sb x6, 5(x5)
sb x9, 3(x8)
sh x3, 0(x2)
sh x6, 3(x5)
sh x9, 8(x8)
sw x3, 0(x2)
sw x6, 2(x5)
sw x9, 7(x8)

  # J-type

jal x1, 16
jal x2, -8
jal x5, 0

   # B-Type

beq x1 x1 16
beq x2 x2 8
beq x3 x4 4
bne x5 x6 12
bne x7 x8 16
bne x9 x9 4
blt x10 x11 20
blt x12 x13 12
blt x14 x15 8
bge x16 x16 8
bge x17 x18 16
bge x19 x20 4
bltu x21 x22 24
bltu x23 x24 12
bltu x25 x26 4
bgeu x27 x28 20
bgeu x29 x29 8
bgeu x30 x31 4
