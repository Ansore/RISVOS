# Not
# Format:
# NOT RD, RS
# Description:
# The contents of RS is fetched and each of the bits is flipped. The resulting
# value is copied into RD
# NOT is a pseudo-instruction, and is assembled identically to:
# XORI RD, RS, -1 // Note That -1 is 0xFFFFFFFF


.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 0xFFFF0000  # x6 = 0xffff0000
  not x5, x6  # x5 = ~x6
  xori x7, x6, -1  # the same as not

stop:
  j stop
.end
