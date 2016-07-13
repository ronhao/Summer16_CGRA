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
    unsigned int x_in = 15;
    unsigned int y_in = 5;
    unsigned int result = 120;
    
    printf("before fence");
    asm volatile ("fence");
    // Invoke the acclerator and check responses
    // test 1:
    //              opcode rd rs1      rs2 funct   
    printf("after fence");
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    printf("test 1: gcd of %d and %d is: %d \n", x_in, y_in, result);
    // test 2:
    x_in = 11;
    y_in = 12;
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    asm volatile ("fence");
    printf("test 2: gcd of %d and %d is: %d \n", x_in, y_in, result);
    // test 3:
    x_in = 24;
    y_in = 15678;
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    asm volatile ("fence");
    printf("test 3: gcd of %d and %d is: %d \n", x_in, y_in, result);
  }while(0);

  return 0;
}
