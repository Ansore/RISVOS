#ifndef __OS_H__
#define __OS_H__

#include "platform.h"
#include "stdarg.h"
#include "stddef.h"
#include "types.h"

int printf(const char *s, ...);
void panic(char *s);
void page_init();
void page_test();

#endif // !__OS_H__
