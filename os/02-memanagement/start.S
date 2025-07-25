#include "platform.h"

.equ STACK_SIZE, 1024

.global _start
.text
_start:
  csrr t0, mhartid # read current hard id
  mv tp, t0  # keep CPU's hard id in its tp for later usage
  bnez t0, park

  # set all bytes in the BSS section to zero
  la a0, _bss_start
  la a1, _bss_end
  bgeu a0, a1, 2f

1:
  sw zero, (a0)
  addi a0, a0, 4
  bltu a0, a1, 1b

2:
  slli t0, t0, 10  # shift left the hart id by 1024
  la sp, stacks + STACK_SIZE  # set the initial stack pointer to the
                              # end of the first stack space
  add sp, sp, t0  # move the current hard stack pointer
                  # to its place in the stack space
  j start_kernel

park:
  wfi
  j park

.balign 16
stacks:
  .skip STACK_SIZE * MAXNUM_CPU  # allocate space for all the harts stacks
  .end
