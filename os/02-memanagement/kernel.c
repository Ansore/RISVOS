#include "uart.h"
#include "os.h"

void start_kernel() {
  uart_init();
  uart_puts("Hello, RVOS!\n");
  uart_puts("This is Ansore!\n");
  page_init();
  page_test();
  while (1) {
  };
}
