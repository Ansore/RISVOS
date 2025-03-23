# Shift Left Logical Immediate
# Format:
# SLLI RD, RS1, IMM
# Description:
# The Immediate value determines the number of bits to shift. The contents
# of RS1 is shifted left that many bits and the result is placed in RD.
# The bits shifted in are filled with zero
# For 32-bit machines, the shift amount must be within 0..31, 0 means no shift is done.


.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 1  # x6 = 1
  slli x5, x6, 3  # x5 = x6 << 3

stop:
  j stop
.end
