# Load Immediate
# Format:
# LI RD,IMM
# Description:
# The immediate value (which can be any 32-bits vlaue) is copied into RD.
# LI is a paseudo-instruction, and is assembled differently depending on
# the actual value present
#
# if the immediate value is in the range of -2,048 .. +2,047,  the it can
# be assembled identically to:
# ADDI RD, x0, IMM
#
# If the immediate value is not within the range -2,048 .. +2,047, but
# is within the range of a 32-bit number (i.e., -2,147,483,648 .. +2,147,483,647) 
# the it can be assembled using this two-instruction sequence:
# LUI RD, Upper-20
# ADDI RD,RD,Lower-12
#
# Where 'Upper-20' represents the uppermost 20bits of the value
# and 'Lower-12' represents the least significant 12-bits of the value
# Note that, due to the immediate operand to the addi has its
# most-significant-bit set to 1 the it will have the effect of
# substracting 1 from the operand in the lui instruction

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  # imm is in the range of [-2,048, +2,047]
  li x5, 0x80
  addi x5, x0, 0x80

  # imm is not in the range of [-2,048, +2,047]
  # and the most-significant-bit of 'lower-12' is 0
  li x6, 0x12345001
  
  lui x6, 0x12345
  addi x6, x6, 0x001

  # imm is not in the range of [-2,048, +2,047]
  # and the most-significant-bit of 'lower-12' is 1
  li x7, 0x12345FFFF

  lui x7, 0x12345
  addi x7, x7, -1

stop:
  j stop
.end
