module vc_Mux2
#(
  parameter p_nbits = 1
)(
  in0, 
  in1,
  sel,
  out
);

  input      [p_nbits-1:0] in0;
  input      [p_nbits-1:0] in1;
  input                    sel;
  output reg [p_nbits-1:0] out;

  always @(*)
  begin
    case ( sel )
      1'd0 : out = in0;
      1'd1 : out = in1;
      default : out = {p_nbits{1'bx}};
    endcase
  end

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
  //reset, // Sync reset input
  q,     // Data output
  d,     // Data input
  en     // Enable input
);

  input                    clk;   
  //input                    reset; 
  output reg [p_nbits-1:0] q;     
  input      [p_nbits-1:0] d;     
  input                    en;    

  always @( posedge clk ) 
    if ( en ) 
      q <= d;
    
  

endmodule

module mem_Accel
(
  clk,
  rst,
  cmd,
  cmd_vld,
  cmd_rdy,
  resp,
  resp_vld,
  resp_rdy,
  mem_req_rdy,
  mem_req_addr,
  mem_req_cmd,
  mem_req_typ,
  mem_req_data,
  mem_resp_vld,
  mem_resp_data,
  mem_resp_store_data
);

  // Inputs and outputs declaration
  input            clk;
  input            rst;
  input  [159:0]   cmd;
  input            cmd_vld;
  output           cmd_rdy;
  output [73:0]    resp;
  output           resp_vld;
  input            resp_rdy;
  input mem_req_rdy;
  output [39:0] mem_req_addr;
  output [4:0] mem_req_cmd;
  output [2:0] mem_req_typ;
  output [63:0] mem_req_data;
  input mem_resp_vld;
  input [63:0] mem_resp_data;
  input [63:0] mem_resp_store_data;
  
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
  
  // Generate the resp Wires
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
           
  // Assign Values To The 5 Unused resp Ports
  //assign SampleAccel_io_mem_req_valid = 1'b0;
  assign SampleAccel_io_autl_acquire_valid = 1'b0;
  assign ClientTileLinkIOArbiter_io_in_1_acquire_ready = 1'b0;
  assign SampleAccel_io_interrupt = 1'b0;
  assign SampleAccel_io_busy = 1'b0;
  
  // Wires between DPath and Ctrl
  wire       resp_vld_dpath_to_ctrl;
  
  wire [4:0] mem_req_cmd_dpath_to_ctrl;
  wire       mem_req_vld_dpath_to_ctrl;
  
  wire       resp_vld_ctrl_to_dpath;
  wire       resp_rdy_ctrl_to_dpath;
  wire       mem_resp_sel_ctrl_to_dpath;
  
  wire [4:0] mem_req_cmd_ctrl_to_dpath;
  wire       mem_req_vld_ctrl_to_dpath;
  wire       mem_req_rdy_ctrl_to_dpath;
  
  mem_Accel_DPath mem_accel_dpath
  (
    .clk                   (clk),
    .rst                   (rst),
    .rs1_data              (cmd_rs1_data),
    .rs2_data              (cmd_rs2_data),
    .cmd_rd                (cmd_inst_rd),
    .resp_data             (resp_data),
    .resp_rd               (resp_rd),
    .mem_dpath_req_typ           (mem_req_typ),
    .mem_req_addr          (mem_req_addr),
    .mem_req_data          (mem_req_data),
    .mem_resp_data         (mem_resp_data),
    .mem_resp_store_data   (mem_resp_store_data),
  
    .resp_vld_to_ctrl      (resp_vld_dpath_to_ctrl),
    
    .mem_req_cmd_to_ctrl   (mem_req_cmd_dpath_to_ctrl),
    .mem_req_vld_to_ctrl   (mem_req_vld_dpath_to_ctrl),
  
    .resp_vld_from_ctrl    (resp_vld_ctrl_to_dpath),
    .resp_rdy_from_ctrl    (resp_rdy_ctrl_to_dpath),
    .mem_resp_sel          (mem_resp_sel_ctrl_to_dpath),
    
    .mem_req_cmd_from_ctrl (mem_req_cmd_ctrl_to_dpath),
    .mem_req_vld_from_ctrl (mem_req_vld_ctrl_to_dpath),
    .mem_req_rdy_from_ctrl (mem_req_rdy_ctrl_to_dpath)
  );
  
  mem_Accel_Ctrl mem_accel_ctrl
  (
    .clk                    (clk),
    .rst                    (rst),
    .cmd_vld                (cmd_vld),
    .cmd_rdy                (cmd_rdy),
    .funct                  (cmd_inst_funct),
    .resp_vld               (resp_vld),
    .resp_rdy               (resp_rdy),
    .mem_resp_vld           (mem_resp_vld),
    .mem_req_vld            (SampleAccel_io_mem_req_valid),
    .mem_req_rdy            (mem_req_rdy),
    .mem_req_cmd            (mem_req_cmd),
  
    .resp_vld_to_dpath      (resp_vld_ctrl_to_dpath),
    .resp_rdy_to_dpath      (resp_rdy_ctrl_to_dpath),
    .mem_resp_sel           (mem_resp_sel_ctrl_to_dpath),
    
    .mem_req_cmd_to_dpath   (mem_req_cmd_ctrl_to_dpath),
    .mem_req_vld_to_dpath   (mem_req_vld_ctrl_to_dpath),
    .mem_req_rdy_to_dpath   (mem_req_rdy_ctrl_to_dpath),
  
    .resp_vld_from_dpath    (resp_vld_dpath_to_ctrl),
    
    .mem_req_cmd_from_dpath (mem_req_cmd_dpath_to_ctrl),
    .mem_req_vld_from_dpath (mem_req_vld_dpath_to_ctrl)
  );
  
endmodule

module mem_Accel_DPath
(
  // ----- Interactions with the father module -----
  clk,
  rst,
  rs1_data,
  rs2_data,
  cmd_rd,
  resp_data,
  resp_rd,
  mem_dpath_req_typ,
  mem_req_addr,
  mem_req_data,
  mem_resp_data,
  mem_resp_store_data,
  
  // ----- Interactions with the Ctrl module -----
  // Signals going to Ctrl
  resp_vld_to_ctrl,
  
  mem_req_cmd_to_ctrl,
  mem_req_vld_to_ctrl,
  
  // Signals coming from Ctrl
  resp_vld_from_ctrl,
  resp_rdy_from_ctrl,
  mem_resp_sel,
  
  mem_req_cmd_from_ctrl,
  mem_req_vld_from_ctrl,
  mem_req_rdy_from_ctrl
);

  // Inputs and outputs declaration
  input  clk;
  input  rst;
  input  [63:0] rs1_data;
  input  [63:0] rs2_data;
  input  [4:0]  cmd_rd;
  output [63:0] resp_data;
  output [4:0]  resp_rd;
  output reg [2:0]  mem_dpath_req_typ;
  output [39:0] mem_req_addr;
  output reg [63:0] mem_req_data;
  input  [63:0] mem_resp_data;
  input  [63:0] mem_resp_store_data;
  
  output        resp_vld_to_ctrl;
  
  output [4:0]  mem_req_cmd_to_ctrl;
  output        mem_req_vld_to_ctrl;
  
  input         resp_vld_from_ctrl;
  input         resp_rdy_from_ctrl;
  input         mem_resp_sel;
  
  input  [4:0]  mem_req_cmd_from_ctrl;
  input         mem_req_vld_from_ctrl;
  input         mem_req_rdy_from_ctrl;
  
  // Data & modules connections
  parameter data_nbits = 64;
  
  wire [63:0] resp_sel_mux_out;
  
  vc_Mux2#(data_nbits) resp_sel_mux
  (
    .in0 (mem_resp_data),
    .in1 (mem_resp_store_data),
    .sel (mem_resp_sel),
    .out (resp_sel_mux_out)
  );
  
  vc_EnReg#(data_nbits) data_reg
  (
    .clk   (clk),
    //.reset (rst),
    .q     (resp_data),
    .d     (resp_sel_mux_out),
    .en    (resp_rdy_from_ctrl)
  );
  
  parameter vld_nbits = 1;
  
  vc_EnReg#(vld_nbits) resp_vld_reg
  (
    .clk   (clk),
    //.reset (rst),
    .q     (resp_vld_to_ctrl),
    .d     (resp_vld_from_ctrl),
    .en    (resp_rdy_from_ctrl)
  );
  
  parameter rd_nbits = 5;
  
  vc_EnReg#(rd_nbits) rd_reg
  (
    .clk   (clk),
    //.reset (rst),
    .q     (resp_rd),
    .d     (cmd_rd),
    .en    (resp_rdy_from_ctrl)
  );
  
  always @ (posedge clk) begin
    mem_req_data <= rs1_data;
  end
  //vc_EnReg#(data_nbits) req_data_reg
  //(
  //  .clk   (clk),
  //  //.reset (rst),
  //  .q     (mem_req_data),
  //  .d     (rs1_data),
  //  .en    (mem_req_rdy_from_ctrl)
  //);
  
  reg [63:0] rs2_data_reg_out;
  
  always @ (posedge clk) begin
    rs2_data_reg_out <= rs2_data;
  end
  //vc_Reg#(data_nbits) req_addr_reg
  //(
  //  .clk   (clk),
  //  //.reset (rst),
  //  .q     (rs2_data_reg_out),
  //  .d     (rs2_data)
  //  //.en    (mem_req_rdy_from_ctrl)
  //);
  
  assign mem_req_addr = rs2_data_reg_out[39:0];
  
  parameter typ_nbits = 3;
  
  wire [2:0] mem_req_typ_before_reg;
  assign mem_req_typ_before_reg  = 3'b011;
  
  always @ (posedge clk) begin
    mem_dpath_req_typ <= mem_req_typ_before_reg;
  end
  
  //vc_EnReg#(typ_nbits) typ_reg
  //(
  //  .clk   (clk),
  //  //.reset (rst),
  //  .q     (mem_req_typ),
  //  .d     (mem_req_typ_before_reg),
  //  .en    (mem_req_rdy_from_ctrl)
  //);
  
  parameter mem_req_cmd_nbits = 5;
  
  vc_EnReg#(mem_req_cmd_nbits) mem_req_cmd_reg
  (
    .clk   (clk),
    //.reset (rst),
    .q     (mem_req_cmd_to_ctrl),
    .d     (mem_req_cmd_from_ctrl),
    .en    (mem_req_rdy_from_ctrl)
  );
  
  vc_EnReg#(vld_nbits) mem_req_vld_reg
  (
    .clk   (clk),
    //.reset (rst),
    .q     (mem_req_vld_to_ctrl),
    .d     (mem_req_vld_from_ctrl),
    .en    (mem_req_rdy_from_ctrl)
  );

endmodule

module mem_Accel_Ctrl
(
  // ----- Interactions with the father module -----
  clk,
  rst,
  cmd_vld,
  cmd_rdy,
  funct,
  resp_vld,
  resp_rdy,
  mem_resp_vld,
  mem_req_vld,
  mem_req_rdy,
  mem_req_cmd,
  
  // ----- Interactions with the DPath module -----
  // Signals going to DPath
  resp_vld_to_dpath,
  resp_rdy_to_dpath,
  mem_resp_sel,
  
  mem_req_vld_to_dpath,
  mem_req_rdy_to_dpath,
  mem_req_cmd_to_dpath,
  
  // Signals coming from DPath
  resp_vld_from_dpath,
  
  mem_req_vld_from_dpath,
  mem_req_cmd_from_dpath
);

  // Inputs and outputs declaration
  input            clk;
  input            rst;
  input            cmd_vld;
  output reg       cmd_rdy;
  input      [6:0] funct;
  output           resp_vld;
  input            resp_rdy;
  input            mem_resp_vld;
  output           mem_req_vld;
  input            mem_req_rdy;
  output     [4:0] mem_req_cmd;
  
  output reg       resp_vld_to_dpath;
  output           resp_rdy_to_dpath;
  output reg       mem_resp_sel;
  
  output reg       mem_req_vld_to_dpath;
  output           mem_req_rdy_to_dpath;
  output reg [4:0] mem_req_cmd_to_dpath;
  
  input            resp_vld_from_dpath;
  
  input            mem_req_vld_from_dpath;
  input      [4:0] mem_req_cmd_from_dpath;  

  // States Definition
  parameter STATE_IDLE       = 3'd0;
  parameter STATE_STORE      = 3'd1;
  parameter STATE_STORE_WAIT = 3'd2;
  parameter STATE_LOAD       = 3'd3;
  parameter STATE_LOAD_WAIT  = 3'd4;
  parameter STATE_DONE       = 3'd5;
  
  // State Advancement
  reg [2:0] state_reg;
  reg [2:0] next_state;

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
  assign resp_go = resp_vld_from_dpath && resp_rdy;
  
  wire store_req;
  wire load_req;
  
  assign store_req = (funct == 0) ? 1'b1 : 1'b0;
  assign load_req  = (funct == 1) ? 1'b1 : 1'b0;
  
  wire mem_go;
  wire mem_back;
  
  assign mem_go   = mem_req_rdy && mem_req_vld_from_dpath;
  assign mem_back = mem_resp_vld;

  always @ (*) begin
    case ( state_reg )
      STATE_IDLE: 
        begin
          if (cmd_go && store_req) begin
            next_state = STATE_STORE;
          end else begin
            if (cmd_go && load_req) begin
              next_state = STATE_LOAD;
            end else begin
              next_state = state_reg;
            end
          end
        end
      STATE_STORE:
        begin
          if (mem_go) begin
            next_state = STATE_STORE_WAIT;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_STORE_WAIT:
        begin
          if (mem_back) begin
            next_state = STATE_DONE;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_LOAD:
        begin
          if (mem_go) begin
            next_state = STATE_LOAD_WAIT;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_LOAD_WAIT:
        begin
          if (mem_back) begin
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
  parameter sel_load  = 1'b0;
  parameter sel_store = 1'b1;
  
  always @ (*) begin
    case ( state_reg )
      STATE_IDLE:
        begin
          cmd_rdy              = 1'b1;
          resp_vld_to_dpath    = 1'b0;
          mem_req_vld_to_dpath = 1'b0;
          mem_req_cmd_to_dpath = 5'bx;
          mem_resp_sel         = 1'bx;
        end
      STATE_STORE:
        begin
          cmd_rdy              = 1'b0;
          resp_vld_to_dpath    = 1'b0;
          mem_req_vld_to_dpath = 1'b1;
          mem_req_cmd_to_dpath = 5'b1;
          mem_resp_sel         = sel_store;
        end
      STATE_STORE_WAIT:
        begin
          cmd_rdy              = 1'b0;
          resp_vld_to_dpath    = 1'b0;
          mem_req_vld_to_dpath = 1'b0;
          mem_req_cmd_to_dpath = 5'bx;
          mem_resp_sel         = sel_store;
        end  
      STATE_LOAD:
        begin
          cmd_rdy              = 1'b0;
          resp_vld_to_dpath    = 1'b0;
          mem_req_vld_to_dpath = 1'b1;
          mem_req_cmd_to_dpath = 5'b0;
          mem_resp_sel         = sel_load;
        end
      STATE_LOAD_WAIT:
        begin
          cmd_rdy              = 1'b0;
          resp_vld_to_dpath    = 1'b0;
          mem_req_vld_to_dpath = 1'b0;
          mem_req_cmd_to_dpath = 5'bx;
          mem_resp_sel         = sel_load;
        end
      STATE_DONE:
        begin
          cmd_rdy              = 1'b0;
          resp_vld_to_dpath    = 1'b1;
          mem_req_vld_to_dpath = 1'b0;
          mem_req_cmd_to_dpath = 5'bx;
          mem_resp_sel         = 1'bx;
        end
    endcase
  end
  
  // Connect wires
  assign mem_req_vld          = mem_req_vld_from_dpath;
  assign mem_req_rdy_to_dpath = mem_req_rdy;
  assign mem_req_cmd          = mem_req_cmd_from_dpath;
  assign resp_vld             = resp_vld_from_dpath;
  assign resp_rdy_to_dpath    = resp_rdy;
  
endmodule

