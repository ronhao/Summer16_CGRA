//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sample RoCC accelerator.
// Compile with riscv-gcc sample-rocc.c

#include <assert.h>
#include <stdio.h>
#include <stdint.h>

int main() {

  do {
    //int a = 5;
    //printf("%d, %d, %d", a, &a, *&a);
    // Setup some test data
    unsigned int x_in = 15;
    unsigned int y_in = 10;   
    unsigned int result = 120;

    //asm volatile ("fence");
    // Invoke the acclerator and check responses
    //
    // test 1:
    //              opcode rd rs1      rs2 funct   
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    printf("test 1: sub of %d and %d is: %d \n", x_in, y_in, result);
    printf("%d", &result);
    printf("%d", *&result);
    // test 2:
    //x_in = 0;
    //y_in = 0x100;
    //asm volatile ("lw      %[x], %[y], $0, 2"  :  "memory" : [x]"r"(x_in), [y]"r"(y_in));
    //asm volatile ("fence");
    //printf("test 2: sub3 of %d and %d is: %d \n", x_in, y_in, result);
    // test 3:
    /*x_in = 24;
    y_in = 15678;
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(result) : [x]"r"(x_in), [y]"r"(y_in));
    asm volatile ("fence");
    printf("test 3: sub3 of %d and %d is: %d \n", x_in, y_in, result);*/
    // test 4:
    //x_in = 0;
    //int lw_imm = 0;
    //asm volatile ("lw %0, %[x], %[y]" : "=r"(result) : [x]"r"(x_in), [y]"i"(lw_imm));
    //printf("test 4: data loaded from %d is %d \n", x_in, result);
  }while(0);

  return 0;
}
