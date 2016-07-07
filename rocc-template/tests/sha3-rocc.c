//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sha3 RoCC accelerator.
// Compile with riscv-gcc sha3-rocc.c
// Run with spike --extension=sha3 pk a.out

#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include "sha3.h"

int main() {

  printf("starting point.\n");

  do {
    printf("start basic test 1.\n");
    // BASIC TEST 1 - 150 zero bytes

    // Setup some test data
    unsigned int ilen = 150;
    unsigned int x_in = 11;
    unsigned int y_in = 22;
    unsigned int sum = 120;

    asm volatile ("fence");
    // Invoke the acclerator and check responses

    // setup accelerator with addresses of input and output
    //              opcode rd rs1          rs2          funct   
    //asm volatile ("custom0 0, %[msg_addr], %[hash_addr], 0" : : [msg_addr]"r"(&input), [hash_addr]"r"(&output));

    // Set length and compute hash
    //              opcode rd rs1      rs2 funct   
    asm volatile ("custom0 %0, %[x], %[y], 0"  :  "=r"(sum) : [x]"r"(x_in), [y]"r"(y_in));
    //asm volatile ("custom0 0, 0, 0, 0");
    asm volatile ("fence");
    // Check result
    int i = 0;
    printf("sum = %d \n", sum);
  }while(0);

  
  printf("success!\n");
  return 0;
}
