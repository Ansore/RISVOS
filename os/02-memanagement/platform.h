#ifndef __PLATFORM_H__
#define __PLATFORM_H__


/**
* QEMU RISC-V virt machine with 16550a UART and VirtIO MMIO
*/
#define MAXNUM_CPU 8

// used in os.ld
#define LENGTH_RAM 128*1024*1024

/*
 * MemoryMap
 * see https://github.com/qemu/qemu/blob/master/hw/riscv/virt.c, virt_memmap[]
 * 0x00001000 -- boot ROM, provided by qemu
 * 0x02000000 -- CLINT
 * 0x0C000000 -- PLIC
 * 0x10000000 -- UART0
 * 0x10001000 -- virtio disk
 * 0x80000000 -- boot ROM jumps here in machine mode, where we load our kernel
 */

/* This machine puts UART registers here in physical memory. */
#define UART0 0x10000000L

#endif // !__PLATFORM_H__
