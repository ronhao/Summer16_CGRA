//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sample RoCC accelerator.
// Compile with riscv-gcc sample-rocc.c

#include <assert.h>
#include <stdio.h>
#include <stdint.h>

int main() {

  do {
    unsigned int a[5] = {1,2,3,4,5};
    unsigned int b[5] = {1,2,4,8,16};
    unsigned int c[5];
    
    unsigned int ld_result_1;
    unsigned int ld_result_2;
    unsigned int add_result;
    unsigned int store_result;
    
    for (int i = 1; i <= 5; i++) 
    { 
      printf("set %d\n", i);
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 1"  :  "=r"(ld_result_1) : [x]"r"(0), [y]"r"(&a[i-1]));
      printf("data loaded from address %d is %d\n", &a[i-1], ld_result_1);
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 1"  :  "=r"(ld_result_2) : [x]"r"(0), [y]"r"(&b[i-1]));
      printf("data loaded from address %d is %d\n", &b[i-1], ld_result_2);
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 2"  :  "=r"(add_result) : [x]"r"(ld_result_1), [y]"r"(ld_result_2));
      printf("add %d to %d, the result is %d\n", ld_result_1, ld_result_2, add_result);
      
      asm volatile ("fence");
      asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(store_result) : [x]"r"(add_result), [y]"r"(&c[i-1]));
      printf("stored data %d into address %d, mem_resp_store_data is %d\n", add_result, &c[i-1], store_result);
    }
  }while(0);

  return 0;
}
