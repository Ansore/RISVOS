# Calling Convention
# Demo to crate a leaf routine
#
# void _start() {
# // calling leaf routine
#   square(3);
# }
#
# int square(int num) {
#   return num * num;
# }

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  la sp, stack_end # prepare stack for calling functions

  li a0, 3
  call square

  # the time return here, a0 should stores the result

stop:
  j stop

# int square(int num)
square:
  # prologue
  addi sp, sp, -8 # move stack point
  sw s0, 0(sp) # saved register push to stack
  sw s1, 4(sp)

  # mul a0,a0,a0 should be fine,
  # programing as below just to demo we can contine use the stack
  mv s0, a0 # a0 is argument register
  mul s1, s0, s0
  mv a0, s1 # move return value to a0

  # epilogue
  lw s0, 0(sp) # stack pop to saved register
  lw s1, 4(sp)
  addi sp, sp, 8 # recovery stack point
  ret

  # add nop here just for demo in gdb
  nop

# allocate stack space
stack_start: # 12 * 4 bytes
  .rept 12  # repeat the following code 12 times
  .word 0
  .endr # end repeat

stack_end:
.end
