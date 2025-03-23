# Add Upper Immediate to PC
# Format:
# AUIPC RD, IMM
# Description:
# AUIPC is used to build pc-relative addresses and uses the U-type format.
# AUIPC forms a 32-bit offset form the 20-bit U-immediate, filling in the 
# lowest 12 bits with zeros, adds this offset to the address of the AUIPC
# instruction, then places the result in register RD.
# Note:
# The current PC can be obtained by setting the U-immediate to 0

.text          # define beginning of text section
.globl _start   # define entry _start

_start:
  auipc x5, 0x12345 # x5 = PC + (0x12345 << 12)
  auipc x6, 0 # x6 = PC, to obtain the current pc

stop:
  j stop
.end
