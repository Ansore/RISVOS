# Calling Convention
# Demo how to write nested routines
#
# void _start()
# {
#     // calling nested routine
#     aa_bb(3, 4);
# }
#
# int aa_bb(int a, int b)
# {
#     return square(a) + square(b);
# }
#
# int square(int num)
# {
#     return num * num;
# }

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  la sp, stack_end # prepare stack for calling functions

  # aa_bb(3, 4)
  li a0, 3
  li a1, 4
  call aa_bb

  # the time return here, a0 should stores the result

stop:
  j stop

# int aa_bb(int a, int b)
# return a^2 + b^2
aa_bb:
  # prologue
  addi sp, sp, -16
  sw s0, 0(sp)
  sw s1, 4(sp)
  sw s2, 8(sp)
  sw ra, 12(sp) # return address

  # cp and store the input params
  mv s0, a0
  mv s1, a1

  # sum will be stored in s2 and is initialized as zero
  li s2, 0
  mv a0, s0
  jal square
  add s2, s2, a0

  mv a0, s1
  jal square
  add s2, s2, a0

  mv a0, s2

  # epilogue
  lw s0, 0(sp)
  lw s1, 4(sp)
  lw s2, 8(sp)
  lw ra, 12(sp)
  addi sp, sp, 16
  ret

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
