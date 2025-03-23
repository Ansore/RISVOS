# Add
# format:
# SUB RD, RS1, RS2
# Description:
# The contents of RS2 is subtracted from the contents of RS1
# and the result is placed in RD

.text   # Define begging of text section
.global _start # define entry _start

_start:
	li  x6, -1 # x6 = -1
	li  x7, -2 # x7 = -2
	sub x5, x6, x7 # x5 = x6 - x7

stop:
	j stop # infinite loop to stop execution
	.end # end of file
