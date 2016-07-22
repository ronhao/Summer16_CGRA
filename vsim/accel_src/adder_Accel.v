// Yangyi: RTL adder
module adder_Accel
(
  clk,
  rst,
  cmd,
  cmd_vld,
  cmd_rdy,
  resp,
  resp_vld,
  resp_rdy,      
);

  initial begin
    $display("adder_Accel");
  end

  // check if can remove the "wire"s
  input              clk;
  input              rst;
  input      [159:0] cmd;
  input              cmd_vld;
  output reg         cmd_rdy;
  output     [73:0]  resp;
  output reg         resp_vld;
  input              resp_rdy;
  
  // Spread The cmd Wires
  wire [6:0]  cmd_inst_funct;  
  wire [4:0]  cmd_inst_rs2;    
  wire [4:0]  cmd_inst_rs1;    
  wire        cmd_inst_xd;     
  wire        cmd_inst_xs1;    
  wire        cmd_inst_xs2;    
  wire [4:0]  cmd_inst_rd;     
  wire [6:0]  cmd_inst_opcode; 
  wire [63:0] cmd_rs1_data;         
  wire [63:0] cmd_rs2_data;         
  
  assign cmd_inst_funct  = cmd[6:0];
  assign cmd_inst_rs2    = cmd[11:7];
  assign cmd_inst_rs1    = cmd[16:12];
  assign cmd_inst_xd     = cmd[17];
  assign cmd_inst_xs1    = cmd[18];
  assign cmd_inst_xs2    = cmd[19];
  assign cmd_inst_rd     = cmd[24:20];
  assign cmd_inst_opcode = cmd[31:25];
  assign cmd_rs1_data    = cmd[95:32];
  assign cmd_rs2_data    = cmd[159:96];
  
  // Generate resp Wires
  wire [63:0] resp_data;
  wire [4:0]  resp_rd;
  wire        SampleAccel_io_mem_req_valid;
  wire        SampleAccel_io_autl_acquire_valid;
  wire        ClientTileLinkIOArbiter_io_in_1_acquire_ready;
  wire        SampleAccel_io_interrupt;
  wire        SampleAccel_io_busy;
  
  assign resp = 
           {
           resp_data, 
           resp_rd, 
           SampleAccel_io_mem_req_valid, 
           SampleAccel_io_autl_acquire_valid, 
           ClientTileLinkIOArbiter_io_in_1_acquire_ready,
           SampleAccel_io_interrupt,
           SampleAccel_io_busy
           };

  // ---Datapath---
  // Add
  parameter data_nbits = 64;
  
  wire [data_nbits-1:0] adder_out;
  
  vc_Adder#(data_nbits) adder
  (
    .in0 (cmd_rs1_data),
    .in1 (cmd_rs2_data),
    .out (adder_out)
  );
  
  vc_EnReg#(data_nbits) d_reg
  (
    .clk    (clk),
    .reset  (rst), // not enabled
    .q      (resp_data),
    .d      (adder_out),
    .en     (cmd_go)
  );
  
  // rd transition
  parameter rd_nbits = 5;
  
  vc_EnReg#(rd_nbits) rd_reg
  (
    .clk   (clk),
    .reset (rst), // not enabled
    .q     (resp_rd),
    .d     (cmd_inst_rd),
    .en    (cmd_go)
  );
  
  // Assign Values To The 5 Unused resp Ports
  assign SampleAccel_io_mem_req_valid = 1'b0;
  assign SampleAccel_io_autl_acquire_valid = 1'b0;
  assign ClientTileLinkIOArbiter_io_in_1_acquire_ready = 1'b0;
  assign SampleAccel_io_interrupt = 1'b0;
  assign SampleAccel_io_busy = 1'b0;

  // ---Control Path---
  // States Definition
  parameter STATE_IDLE = 2'd0;
  parameter STATE_DONE = 2'd1;

  // State Advancement
  reg [1:0]  state_reg;
  reg [1:0]  next_state;

  always @ (posedge clk) begin
    if (rst) begin
      state_reg <= STATE_IDLE;
    end else begin
      state_reg <= next_state;
    end
  end

  // State Advancement Calculations
  wire cmd_go;
  wire resp_go;

  assign cmd_go  = cmd_vld  && cmd_rdy;
  assign resp_go = resp_vld && resp_rdy; 

  always @ (*) begin
    case ( state_reg )
      STATE_IDLE: 
        begin
          if (cmd_go) begin
            next_state = STATE_DONE;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_DONE: 
        begin
          if (resp_go) begin
            next_state = STATE_IDLE;
          end else begin
            next_state = state_reg;
          end
        end
    endcase
  end

  // State Outputs
  always @ (*) begin
    case ( state_reg )
      STATE_IDLE:
        begin
        cmd_rdy  = 1'b1;
        resp_vld = 1'b0;
        end
      STATE_DONE:
        begin
        cmd_rdy  = 1'b0;
        resp_vld = 1'b1;
        end
    endcase
  end
  /*
  task as
  (
    input as_cmd_rdy;
    input as_resp_vld
  );
  begin
    cmd_rdy  = as_cmd_rdy;
    resp_vld = as_resp_vld;
  end
  endtask
  
  always @ (*) begin
    case ( state_reg )
      //              cmd_rdy, resp_vld
      STATE_IDLE:  as(      1,        0);
      STATE_DONE:  as(      0,        1);
    endcase
  end
  */
endmodule

module vc_Adder
#(
  parameter p_nbits = 1
)(
  in0,
  in1,
  //cin,
  out,
  //cout
);

  input  [p_nbits-1:0] in0;
  input  [p_nbits-1:0] in1;
  //input                cin;
  output [p_nbits-1:0] out;
  //output               cout;

  //assign {cout,out} = in0 + in1 + cin;
  assign out = in0 + in1;

endmodule

module vc_Reg
#(
  parameter p_nbits = 1
)(
  clk, // Clock input
  q,   // Data output
  d    // Data input
);

  input                    clk;
  output reg [p_nbits-1:0] q;
  input      [p_nbits-1:0] d;

  always @( posedge clk ) begin
    q <= d;
  end

endmodule

module vc_EnReg
#(
  parameter p_nbits = 1
)(
  clk,   // Clock input
  reset, // Sync reset input
  q,     // Data output
  d,     // Data input
  en     // Enable input
);

  input                    clk;   
  input                    reset; 
  output reg [p_nbits-1:0] q;     
  input      [p_nbits-1:0] d;     
  input                    en;    

  always @( posedge clk )
    if ( en )
      q <= d;

endmodule
