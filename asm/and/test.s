# And
# Format:
# And RD, RS1, RS2
# Description:
# The contents of RS1 is logically ANDed with the contents of RS2 and the
# result is placed in RD.

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 0x10  # x6 = 0b0001-0000
  li x7, 0x11  # x6 = 0b0001-0001
  and x5, x6, x7  # x5 = x6 & x7

stop:
  j stop
.end
