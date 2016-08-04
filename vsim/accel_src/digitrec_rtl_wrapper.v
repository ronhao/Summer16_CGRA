module digitrec_wrapper
(
  clk,
  rst,
  cmd,
  cmd_vld,
  cmd_rdy,
  resp,
  resp_vld,
  resp_rdy,
  mem_req_vld,
  mem_req_rdy,
  mem_req,
  mem_resp_vld,
  mem_resp
);

  // ------- INPUTS & OUTPUTS DECLARATION -------
  input            clk;
  input            rst;
  
  // Wires to Core
  input  [159:0]   cmd;
  input            cmd_vld;
  output           cmd_rdy;
  output [72:0]    resp;
  output           resp_vld;
  input            resp_rdy;
  
  // Wires to Mem
  output           mem_req_vld;
  input            mem_req_rdy;
  output [123:0]   mem_req;
  input            mem_resp_vld;
  input  [252:0]   mem_resp;
  
  // ------- WIRES MANIPULATION -------
  // Spread the cmd wires
  wire [6:0]  funct;  
  wire [4:0]  rs2;    
  wire [4:0]  rs1;    
  wire        xd;     
  wire        xs1;    
  wire        xs2;    
  wire [4:0]  rd;     
  wire [6:0]  opcode; 
  wire [63:0] rs1_data;         
  wire [63:0] rs2_data;         
  
  assign funct       = cmd[6:0];
  assign rs2         = cmd[11:7];
  assign rs1         = cmd[16:12];
  assign xd          = cmd[17];
  assign xs1         = cmd[18];
  assign xs2         = cmd[19];
  assign rd          = cmd[24:20];
  assign opcode      = cmd[31:25];
  assign rs1_data    = cmd[95:32];
  assign rs2_data    = cmd[159:96];
  
  // Generate the resp wires
  wire [63:0] resp_data;
  wire [4:0]  resp_rd;
  //wire        SampleAccel_io_mem_req_valid;
  wire        SampleAccel_io_autl_acquire_valid;
  wire        ClientTileLinkIOArbiter_io_in_1_acquire_ready;
  wire        SampleAccel_io_interrupt;
  wire        SampleAccel_io_busy;
  
  assign resp = 
           {
           resp_data, 
           resp_rd, 
           //SampleAccel_io_mem_req_valid, 
           SampleAccel_io_autl_acquire_valid, 
           ClientTileLinkIOArbiter_io_in_1_acquire_ready,
           SampleAccel_io_interrupt,
           SampleAccel_io_busy
           };
           
  // Assign Values To The 5 Unused resp Ports
  //assign SampleAccel_io_mem_req_valid = 1'b0;
  assign SampleAccel_io_autl_acquire_valid = 1'b0;
  assign ClientTileLinkIOArbiter_io_in_1_acquire_ready = 1'b0;
  assign SampleAccel_io_interrupt = 1'b0;
  //assign SampleAccel_io_busy = 1'b0;
  
  // Generate the mem req wires
  wire [39:0] mem_req_addr;
  wire [9:0]  mem_req_tag;
  wire [4:0]  mem_req_cmd;
  wire [2:0]  mem_req_typ;
  wire        mem_req_kill;
  wire        mem_req_phys;
  wire [63:0] mem_req_data;
  
  //assign mem_req_tag  = 10'b0;
  //assign mem_req_kill = 1'b0;
  //assign mem_req_phys = 1'b1;
  
  assign mem_req = 
           {
             mem_req_addr,
             mem_req_tag,
             mem_req_cmd,
             mem_req_typ,
             mem_req_kill,
             mem_req_phys,
             mem_req_data
           };
           
  // Spread the mem resp wires
  wire [39:0] mem_resp_addr;
  wire [9:0]  mem_resp_tag;
  wire [4:0]  mem_resp_cmd;
  wire [2:0]  mem_resp_typ;
  wire [63:0] mem_resp_data;
  wire        mem_resp_nack;
  wire        mem_resp_replay;
  wire        mem_resp_has_data;
  wire [63:0] mem_resp_data_word_bypass;
  wire [63:0] mem_resp_store_data;
  
  assign mem_resp_addr             = mem_resp[252:213];
  assign mem_resp_tag              = mem_resp[212:203];
  assign mem_resp_cmd              = mem_resp[202:198];
  assign mem_resp_typ              = mem_resp[197:195];
  assign mem_resp_data             = mem_resp[194:131];
  assign mem_resp_nack             = mem_resp[130];
  assign mem_resp_replay           = mem_resp[129];
  assign mem_resp_has_data         = mem_resp[128];
  assign mem_resp_data_word_bypass = mem_resp[127:64];
  assign mem_resp_store_data       = mem_resp[63:0];
  
  digitrec digitrec_instance
  (
    .clk (clk), 
    .rst (rst), 
    .cc_busy_o (SampleAccel_io_busy), 
    //.cc_interrupt_o, 
    //.cc_status_i, 
    //.cc_exception_i, 
    //.cc_host_id_i, 
    .core_cmd_ready_o (cmd_rdy), 
    .core_cmd_valid_i (cmd_vld), 
    .core_cmd_inst_funct_i (funct), 
    .core_cmd_inst_rs1_i (rs1), 
    .core_cmd_inst_rs2_i (rs2), 
    .core_cmd_inst_xd_i (xd), 
    .core_cmd_inst_xs1_i (xs1), 
    .core_cmd_inst_xs2_i (xs2), 
    .core_cmd_inst_rd_i (rd), 
    .core_cmd_inst_opcode_i (opcode), 
    .core_cmd_rs1_i (rs1_data), 
    .core_cmd_rs2_i (rs2_data), 
    .core_resp_ready_i (resp_rdy), 
    .core_resp_valid_o (resp_vld), 
    .core_resp_rd_o (resp_rd), 
    .core_resp_data_o (resp_data), 
    .mem_req_ready_i (mem_req_rdy), 
    .mem_req_valid_o (mem_req_vld), 
    .mem_req_addr_o (mem_req_addr), 
    .mem_req_tag_o (mem_req_tag),
    .mem_req_cmd_o (mem_req_cmd), 
    .mem_req_typ_o (mem_req_typ), 
    .mem_req_phys_o (mem_req_phys), 
    .mem_req_data_o (mem_req_data), 
    .mem_resp_valid_i(mem_resp_vld), 
    .mem_resp_addr_i (mem_resp_addr), 
    .mem_resp_tag_i (mem_resp_tag), 
    .mem_resp_cmd_i (mem_resp_cmd), 
    .mem_resp_typ_i (mem_resp_typ), 
    .mem_resp_data_i (mem_resp_data),
    .mem_resp_has_data_i (mem_resp_has_data), 
    .mem_resp_data_word_bypass_i (mem_resp_data_word_bypass), 
    .mem_resp_store_data_i (mem_resp_store_data), 
    .mem_resp_nack_i (mem_resp_nack), 
    .mem_resp_replay_i (mem_resp_replay)
  );
  
endmodule
