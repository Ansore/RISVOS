# C CALL ASM

.text          # define beginning of text section
.global _start   # define entry _start
.global  foo  # foo is a C function defined in test.c

_start:
  la sp, stack_end # prepare stack for calling functions

  li a0, 1
  li a1, 2
  call foo
  # RISCV use a0 & a1 to transfer return value
  # check value of a0


stop:
  j stop

# allocate stack space
stack_start: # 12 * 4 bytes
  .rept 12  # repeat the following code 12 times
  .word 0
  .endr # end repeat

stack_end:
.end
