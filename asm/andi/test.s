# And Immediate
# Format:
# And RD, RS1, IMM
# Description:
# The Immediate value (a sign-extended 12-bit value, i.e., -2,048 .. +2,047)
# is logically ANDed with the contents of RD1 and the result is placed in RD.

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 0x10  # x6 = 0b0001-0000
  andi x5, x6, 0x01  # x5 = x6 & 0x01

stop:
  j stop
.end
