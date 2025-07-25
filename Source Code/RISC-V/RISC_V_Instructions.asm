# Initialize registers
addi x1, x0, 5
addi x2, x0, 10
addi x3, x0, 15
addi x4, x0, 0xFF
addi x5, x0, -20
lui x5 0x12345
auipc x6 0x1

# R-Type instructions
add  x6, x1, x2      # x6 = 5 + 10 = 15
sub  x7, x3, x1      # x7 = 15 - 5 = 10
sll  x8, x1, x0      # x8 = 5 << 0 = 5
slt  x9, x1, x3      # x9 = (5 < 15) = 1
sltu x10, x5, x0     # x10 = (unsigned -20 < 0) = 0
xor  x11, x1, x2     # x11 = 5 ^ 10 = 15
srl  x12, x4, x0     # x12 = 0xFF >> 0 = 255
sra  x13, x5, x0     # x13 = -20 >> 0 = -20
or   x14, x1, x2     # x14 = 5 | 10 = 15
and  x15, x1, x2     # x15 = 5 & 10 = 0

# I-Type arithmetic
slti  x16, x1, 10    # x16 = 1
sltiu x17, x1, 10    # x17 = 1
xori  x18, x1, 1     # x18 = 5 ^ 1 = 4
ori   x19, x1, 2     # x19 = 5 | 2 = 7
andi  x20, x1, 7     # x20 = 5 & 7 = 5
slli  x21, x1, 1     # x21 = 5 << 1 = 10
srli  x22, x4, 1     # x22 = 0xFF >> 1 = 127
srai  x23, x5, 1     # x23 = -20 >> 1 = -10

# Memory setup
addi x31, x0, 100     # x31 = base address

# Store
sw x6, 0(x31)         # store 15
sh x7, 4(x31)         # store 10 (halfword)
sb x8, 8(x31)         # store 5  (byte)

# Load
lw x24, 0(x31)        # x24 = 15
lh x25, 4(x31)        # x25 = 10
lhu x26, 4(x31)       # x26 = 10
lb x27, 8(x31)        # x27 = 5
lbu x28, 8(x31)       # x28 = 5

# Branch instructions
beq  x1, x1, skip1     # should jump
addi x29, x0, 111      # skipped
skip1:

bne  x1, x2, skip2     # should jump
addi x30, x0, 222      # skipped
skip2:

blt  x1, x2, skip3     # should jump
addi x30, x0, 333      # skipped
skip3:

bge  x2, x1, skip4     # should jump
addi x30, x0, 444      # skipped
skip4:

bltu x1, x2, skip5     # should jump
addi x30, x0, 555      # skipped
skip5:

bgeu x2, x1, skip6     # should jump
addi x30, x0, 666      # skipped
skip6:

# Jumps
jal x10, jal_target    # jump to jal_target
addi x11, x0, 999      # skipped
jal_target:

addi x12, x0, 64       # x12 = 64
jalr x13, x12, 0       # jump to 64
addi x14, x0, 777      # skipped
