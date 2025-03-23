EXEC = test

SRC = ${EXEC}.s ${EXEC}.c

GDBINIT = gdbinit

CROSS_COMPILE = riscv64-elf-
CFLAGS = -nostdlib -fno-builtin -march=rv32g -mabi=ilp32 -g -Wall

QEMU = qemu-system-riscv32
QFLAGS = -nographic -smp 1 -machine virt -bios none

GDB = gdb
CC = ${CROSS_COMPILE}gcc
OBJCOPY = ${CROSS_COMPILE}objcopy
OBJDUMP = ${CROSS_COMPILE}objdump

.DEFAULT_GOAL := all
all:
	@${CC} ${CFLAGS} ${SRC} -Ttext=0x80000000 -o ${EXEC}.elf
	@${OBJCOPY} -j .text -O binary ${EXEC}.elf ${EXEC}.bin

.PHONY : debug
debug: all
	@${QEMU} ${QFLAGS} -kernel ${EXEC}.elf -s -S &
	@${GDB} ${EXEC}.elf -q -x ${GDBINIT}

.PHONY : code
code: all
	@${OBJDUMP} -S ${EXEC}.elf | less

.PHONY : hex
hex: all
	@hexdump -C ${EXEC}.bin

.PHONY : clean
clean:
	rm -rf *.o *.bin *.elf
