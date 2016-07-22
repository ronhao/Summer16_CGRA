//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sample RoCC accelerator.
// Compile with riscv-gcc sample-rocc.c

#include <assert.h>
#include <stdio.h>
#include <stdint.h>

int main() {

  do {
    for (int i = 1; i < 10; i++) 
    { 
      unsigned int data_1 = i + 100;
      unsigned int data_2 = i + 200;
      unsigned long addr_1 = i;
      unsigned long addr_2 = i + 20;
      unsigned int result;
      printf("Set %d, storing %d and %d into address %d and %d, add them, and store the result into %d\n");
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(data_1), [y]"r"(addr_1));
      printf("stored data %d into address %d, mem_resp_store_data is %d\n", data_1, addr_1, result);
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(data_2), [y]"r"(addr_2));
      printf("stored data %d into address %d, mem_resp_store_data is %d\n", data_2, addr_2, result);
      
      unsigned int *p_d1 = addr_1;
      unsigned int *p_d2 = addr_2;
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 2"  :  "=r"(result) : [x]"r"(*p_d1), [y]"r"(*p_d2));
      printf("add %d to %d, the result is %d\n", *p_d1, *p_d2, result);
    }
  }while(0);

  return 0;
}
