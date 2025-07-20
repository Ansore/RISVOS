#include "uart.h"

void start_kernel() {
  uart_init();
  uart_puts("Hello, RVOS!\n");
  uart_puts("This is Ansore!\n");
  while (1) {
  };
}
