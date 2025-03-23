# Load Address
# Format:
# LUI RD, Address
# Description:
#   The address of some memory location is copied into RD
# LA is a paseudo-instruction, and is assmbled to a sequence of two
# instruction to achieve the same effet.
# AUIPC RD,Upper-20
# ADDI RD,RD,Lower-12
# The 'address' can refer to any location within the 32-bit memory space
# the address is coverted to a PC-relative address, with an offset of
# 32 bits. This offset is then broken into two piece: a upper 20-bit
# piece and a lower 12-bit piece.

.text          # define beginning of text section
.global _start   # define entry _start

_start:
  la x5, _start  # x5 = _start
  jr x5

stop:
  j stop
.end
