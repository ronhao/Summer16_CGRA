#include <stdio.h>
#include <hls_stream.h>
#include <ap_int.h>
using namespace hls;

struct CMD {
  ap_uint<7> inst_funct;
  ap_uint<5> inst_rs2;
  ap_uint<5> inst_rs1;
  ap_uint<1> inst_xd;
  ap_uint<1> inst_xs1;
  ap_uint<1> inst_xs2;
  ap_uint<5> inst_rd;
  ap_uint<7> inst_opcode;
  ap_uint<64> rs1;
  ap_uint<64> rs2;
};

struct RESP {
  ap_uint<1> io_busy;
  ap_uint<1> io_interrupt;
  ap_uint<1> io_autl_acquire_ready;
  ap_uint<1> io_autl_acquire_valid;
  ap_uint<1> io_mem_req_valid;
  ap_uint<5> rd;
  ap_uint<64> data;
};

void mul(stream<CMD> &io_cmd, stream<RESP> &io_resp){
  #pragma HLS data_pack variable=io_cmd
  #pragma HLS data_pack variable=io_resp
  CMD cmd_token;
  RESP resp_token;
  cmd_token = io_cmd.read();

  ap_uint<64> a = cmd_token.rs1;
  ap_uint<64> b = cmd_token.rs2;

  // try one-line code
  a = a * b;
  
  resp_token.io_busy = 0;
  resp_token.io_interrupt = 0;
  resp_token.io_autl_acquire_ready = 0;
  resp_token.io_autl_acquire_valid = 0;
  resp_token.io_mem_req_valid = 0;
  resp_token.rd = cmd_token.inst_rd;
  resp_token.data = a;  
  io_resp.write(resp_token);
}

int main(){

  stream<CMD> cmd_stream;
  stream<RESP> resp_stream;

  CMD cmd_test_token;

  cmd_test_token.inst_funct = 0;
  cmd_test_token.inst_rs2 = 0;
  cmd_test_token.inst_rs1 = 0;
  cmd_test_token.inst_xd = 0;
  cmd_test_token.inst_xs1 = 0;
  cmd_test_token.inst_xs2 = 0;
  cmd_test_token.inst_rd = 0;
  cmd_test_token.inst_opcode = 0;
  cmd_test_token.rs1 = 5;
  cmd_test_token.rs2 = 15;

  cmd_stream.write(cmd_test_token);

  mul(cmd_stream, resp_stream);

  RESP resp_test_token = resp_stream.read();

  long result = resp_test_token.data;

  printf("%li\n", result);

  return 0;
}
