# Load Upper Immediate
# Format:
# LUI RD, IMM
# Description:
# The instruction contains a 20-bit immediate value. This value is placed
# in the leftmost (i.e. upper, most siginificant) 20 bits of the register
# RD and the rightmost (i.e. lower, least siginificant) 12-bits are set to zero

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  lui x5, 0x12345  # x5 = 0x12345 << 12
  addi x5, x5, 0x678  # x5 = x5 + 0x678

stop:
  j stop
.end
