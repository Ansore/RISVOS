# Branch if Not Equal
# Format:
# BNE RS1, RS2, IMM
# Description:
# The contents of RS1 is compared to the contents of RS2, If not equal,
# control jumps to a PC-relative target address
# Note:
# When programming, we just provide label instead of immediate value,
# and leave linker to provide the final immediate value.

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  # i = 0
  # while (i < 5) i++;
  li x5, 0
  li x6, 5

loop:
  addi x5, x5, 1
  bne x5, x6, loop

_array:
  .byte 0x00
  .byte 0x00

.end
