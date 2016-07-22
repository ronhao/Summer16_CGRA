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
    unsigned int y_in = 721;
    unsigned int result = 120;
    
    asm volatile ("fence");
    // Invoke the acclerator and check responses
    // test 1:
    //              opcode rd rs1      rs2 funct   
    asm volatile ("custom0 %0, %[x], %[y], 2"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    printf("test 1: add %d to %d, the result is %d\n", x_in, y_in, result);
    
  }while(0);

  return 0;
}
