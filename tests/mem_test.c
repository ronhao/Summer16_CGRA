//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sample RoCC accelerator.
// Compile with riscv-gcc sample-rocc.c

#include <assert.h>
#include <stdio.h>
#include <stdint.h>

int main() {

  do {
    // Setup some test data
    unsigned int x_in = 715;
    unsigned long long y_in = 0;
    unsigned int result = 120;
    
    asm volatile ("fence");
    // Invoke the acclerator and check responses
    // test 1:
    //              opcode rd rs1      rs2 funct   
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    printf("test 1: stored data %d into address %d, mem_resp_store_data is %d\n", x_in, y_in, result);
    
    asm volatile ("fence");
    // test 2:
    x_in = 0;
    y_in = 0;
    asm volatile ("custom0 %0, %[x], %[y], 1"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    printf("test 2: data loaded from address %d is %d\n", y_in, result);
    
    asm volatile ("fence");
  }while(0);

  return 0;
}
