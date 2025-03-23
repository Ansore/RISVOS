# Substract Immediate
# Description:
# There is no `substract immediate` instruction because substraction is
# equivalent to adding a negative value of immediate

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  li x6, 30  # x6 = 30
  addi x5, x6, -20  # x5 = x6 - 20

stop:
  j stop
.end
