# Shift Right Arithmetic Immediate
# Format:
# SRAI RD, RS1, IMM
# Description:
# The Immediate value determines the number of bits to shift. The contents
# of RS1 is shifted right that many bits and the result is placed in RD.
# The shift is 'Arithmetic', i.e., the sign bit is repeatedly shifted in on
# the most-significant end.
# Comment
# In C, for singed integer, >> is shift right with Arithmetic.


.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 0x81000000  # x6 = 0xb1010-0000-0000-0000
  srai x5, x6, 4  # x5 = x6 << 4

stop:
  j stop
.end
