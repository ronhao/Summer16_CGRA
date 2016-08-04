module mem_Accel_B
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
  assign SampleAccel_io_busy = 1'b0;
  
  // Generate the mem req wires
  wire [39:0] mem_req_addr;
  wire [9:0]  mem_req_tag;
  wire [4:0]  mem_req_cmd;
  wire [2:0]  mem_req_typ;
  wire        mem_req_kill;
  wire        mem_req_phys;
  wire [63:0] mem_req_data;
  
  assign mem_req_tag  = 10'b0;
  assign mem_req_kill = 1'b0;
  assign mem_req_phys = 1'b1;
  
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
  
  // Wires between DPath and Ctrl
  wire       cmd_go_ctrl_to_dpath;
  wire       mem_req_vld_ctrl_to_dpath;
  wire [4:0] mem_req_cmd_ctrl_to_dpath;
  wire       mem_go_ctrl_to_dpath;
  wire       mem_back_ctrl_to_dpath;
  wire       mem_resp_sel_ctrl_to_dpath;
  wire       rd_sel_ctrl_to_dpath;
  wire       resp_data_sel_ctrl_to_dpath;
  wire       cc_done_ctrl_to_dpath;
  
  mem_Accel_B_DPath mem_b_dpath
  (
    .dpath_clk                   ( clk ),
    .dpath_rst                   ( rst ),
  
    .dpath_P_rd                  ( rd ),
    .dpath_P_rs1_data            ( rs1_data ),
    .dpath_P_rs2_data            ( rs2_data ),
  
    .dpath_cmd_go                ( cmd_go_ctrl_to_dpath ),
  
    .dpath_I_mem_req_vld         ( mem_req_vld_ctrl_to_dpath ),
    .dpath_I_mem_req_cmd         ( mem_req_cmd_ctrl_to_dpath ),
  
    .dpath_mem_go                ( mem_go_ctrl_to_dpath ),
  
    .dpath_W_mem_req_vld         ( mem_req_vld ),
    .dpath_W_mem_req_cmd         ( mem_req_cmd ),
    .dpath_W_mem_req_data        ( mem_req_data ),
    .dpath_W_mem_req_addr        ( mem_req_addr ),
    .dpath_W_mem_req_typ         ( mem_req_typ ),
    .dpath_W_mem_resp_data       ( mem_resp_data ),
    .dpath_W_mem_resp_store_data ( mem_resp_store_data ),
    .dpath_W_rd_sel              ( rd_sel_ctrl_to_dpath ),
    .dpath_W_resp_data_sel       ( resp_data_sel_ctrl_to_dpath ),
    .dpath_W_mem_resp_sel        ( mem_resp_sel_ctrl_to_dpath ),
  
    .dpath_mem_back              ( mem_back_ctrl_to_dpath ),
    .dpath_cc_done               ( cc_done_ctrl_to_dpath ),
    
    .dpath_D_rd                  ( resp_rd ),
    .dpath_D_resp_data           ( resp_data )
  );
  
  mem_Accel_B_Ctrl mem_b_ctrl
  (
    .ctrl_clk           ( clk ),
    .ctrl_rst           ( rst ),
    .ctrl_cmd_vld       ( cmd_vld ),
    .ctrl_funct         ( funct ),
    .ctrl_mem_req_rdy   ( mem_req_rdy ),
    .ctrl_mem_resp_vld  ( mem_resp_vld ),
    .ctrl_resp_rdy      ( resp_rdy ),
  
    .ctrl_cmd_rdy       ( cmd_rdy ),
    .ctrl_cmd_go        ( cmd_go_ctrl_to_dpath ),
    .ctrl_mem_req_vld   ( mem_req_vld_ctrl_to_dpath ),
    .ctrl_mem_req_cmd   ( mem_req_cmd_ctrl_to_dpath ),
    .ctrl_mem_go        ( mem_go_ctrl_to_dpath ),
    .ctrl_mem_back      ( mem_back_ctrl_to_dpath ),
    .ctrl_rd_sel        ( rd_sel_ctrl_to_dpath ),
    .ctrl_resp_data_sel ( resp_data_sel_ctrl_to_dpath ),
    .ctrl_mem_resp_sel  ( mem_resp_sel_ctrl_to_dpath ),
    .ctrl_resp_vld      ( resp_vld ),
    .ctrl_cc_done       ( cc_done_ctrl_to_dpath )
  );
  
endmodule

module mem_Accel_B_DPath
(
  dpath_clk,
  dpath_rst,
  
  dpath_P_rd,
  dpath_P_rs1_data,
  dpath_P_rs2_data,
  
  dpath_cmd_go,
  
  dpath_I_mem_req_vld,
  dpath_I_mem_req_cmd,
  
  dpath_mem_go,
  
  dpath_W_mem_req_vld,
  dpath_W_mem_req_cmd,
  dpath_W_mem_req_data,
  dpath_W_mem_req_addr,
  dpath_W_mem_req_typ,
  dpath_W_mem_resp_data,
  dpath_W_mem_resp_store_data,
  dpath_W_rd_sel,
  dpath_W_resp_data_sel,
  dpath_W_mem_resp_sel, 
  
  dpath_mem_back,
  dpath_cc_done,
   
  dpath_D_rd,
  dpath_D_resp_data
);

  // INPUTS & OUTPUTS DECLARATION
  input             dpath_clk;
  input             dpath_rst;
  
  input [4:0]       dpath_P_rd;
  input [63:0]      dpath_P_rs1_data;
  input [63:0]      dpath_P_rs2_data;
  
  input             dpath_cmd_go;
  
  input             dpath_I_mem_req_vld;
  input [4:0]       dpath_I_mem_req_cmd;
  
  input             dpath_mem_go;
  
  output reg        dpath_W_mem_req_vld;
  output reg [4:0]  dpath_W_mem_req_cmd;
  output reg [63:0] dpath_W_mem_req_data;
  output reg [39:0] dpath_W_mem_req_addr;
  output reg [2:0]  dpath_W_mem_req_typ;
  input      [63:0] dpath_W_mem_resp_data;
  input      [63:0] dpath_W_mem_resp_store_data;
  input             dpath_W_rd_sel;
  input             dpath_W_resp_data_sel;
  input             dpath_W_mem_resp_sel;
  
  input             dpath_mem_back;
  input             dpath_cc_done;
  
  output reg [4:0]  dpath_D_rd;
  output reg [63:0] dpath_D_resp_data;
  
  // ---------- P (prepare) stage ----------------
  
  // ---------- I (issue) stage ------------------
  reg  [4:0]  dpath_I_rd;
  reg  [63:0] dpath_I_rs1_data;
  reg  [63:0] dpath_I_rs2_data;
  wire [2:0]  dpath_I_mem_req_typ;
  
  always @ (posedge dpath_clk) begin
    if (dpath_cmd_go) begin
      dpath_I_rd       <= dpath_P_rd;
      dpath_I_rs1_data <= dpath_P_rs1_data;
      dpath_I_rs2_data <= dpath_P_rs2_data;
    end
  end
  
  assign dpath_I_mem_req_typ = 3'b011;
  
  // ---------- Bypass portions from I stage -----
  parameter data_nbits = 64;
  
  wire [63:0] dpath_I_cc_resp_data;
  
  vc_Adder#(data_nbits) vc_adder
  (
    .in0 (dpath_I_rs1_data),
    .in1 (dpath_I_rs2_data),
    .out (dpath_I_cc_resp_data)
  );
  
  
  // ---------- W (wait) stage -------------------
  reg [4:0]  dpath_W_rd;
  reg [4:0]  dpath_W_rd_selected;
  reg [63:0] dpath_W_resp_data_selected;
  
  always @ (posedge dpath_clk) begin
    if (1/*dpath_mem_go*/) begin
      dpath_W_rd           <= dpath_I_rd;
      dpath_W_mem_req_vld  <= dpath_I_mem_req_vld;
      dpath_W_mem_req_cmd  <= dpath_I_mem_req_cmd;
      dpath_W_mem_req_data <= dpath_I_rs1_data;
      dpath_W_mem_req_addr <= dpath_I_rs2_data[39:0];
      dpath_W_mem_req_typ  <= dpath_I_mem_req_typ;
    end
  end
  
  // rd mux
  always @ (*) begin
    if (dpath_W_rd_sel) begin
      dpath_W_rd_selected = dpath_W_rd;
    end else begin
      dpath_W_rd_selected = dpath_I_rd;
    end
  end
  
  // resp data mux
  always @ (*) begin
    if (dpath_W_resp_data_sel) begin
      if (dpath_W_mem_resp_sel) begin
        dpath_W_resp_data_selected = dpath_W_mem_resp_store_data;
      end else begin
        dpath_W_resp_data_selected = dpath_W_mem_resp_data;
      end
    end else begin
      dpath_W_resp_data_selected = dpath_I_cc_resp_data;
    end
  end
  
  // ---------- D (done) stage -------------------
  always @ (posedge dpath_clk) begin
    if (dpath_mem_back || dpath_cc_done) begin
      dpath_D_rd        <= dpath_W_rd_selected;
      dpath_D_resp_data <= dpath_W_resp_data_selected;
    end
  end

endmodule

module mem_Accel_B_Ctrl
(
  ctrl_clk,
  ctrl_rst,
  ctrl_cmd_vld,
  ctrl_funct,
  ctrl_mem_req_rdy,
  ctrl_mem_resp_vld,
  ctrl_resp_rdy,
  
  ctrl_cmd_rdy,
  ctrl_cmd_go,
  ctrl_mem_req_vld,
  ctrl_mem_req_cmd,
  ctrl_mem_go,
  ctrl_mem_back,
  ctrl_rd_sel,
  ctrl_resp_data_sel,
  ctrl_mem_resp_sel,
  ctrl_resp_vld,
  ctrl_cc_done
);

  input            ctrl_clk;
  input            ctrl_rst;
  input            ctrl_cmd_vld;
  input [6:0]      ctrl_funct;
  input            ctrl_mem_req_rdy;
  input            ctrl_mem_resp_vld;
  input            ctrl_resp_rdy;
  
  output reg       ctrl_cmd_rdy;
  output           ctrl_cmd_go;
  output reg       ctrl_mem_req_vld;
  output reg [4:0] ctrl_mem_req_cmd;
  output           ctrl_mem_go;
  output           ctrl_mem_back;
  output reg       ctrl_rd_sel;
  output reg       ctrl_resp_data_sel;
  output reg       ctrl_mem_resp_sel;
  output reg       ctrl_resp_vld;
  output reg       ctrl_cc_done;
  
  // States Definition
  parameter STATE_IDLE       = 4'd0;
  parameter STATE_STORE      = 4'd1;
  parameter STATE_STORE_WAIT = 4'd2;
  parameter STATE_LOAD       = 4'd3;
  parameter STATE_LOAD_WAIT  = 4'd4;
  parameter STATE_DONE       = 4'd5;
  parameter STATE_CC         = 4'd6; // CC stands for combinational calculation
  
  // State Advancement
  reg [3:0] state_reg;
  reg [3:0] next_state;

  always @ (posedge ctrl_clk) begin
    if (ctrl_rst) begin
      state_reg <= STATE_IDLE;
    end else begin
      state_reg <= next_state;
    end
  end
  
  // State Advancement Calculations
  wire ctrl_resp_go;
  
  assign ctrl_cmd_go  = ctrl_cmd_vld  && ctrl_cmd_rdy;
  assign ctrl_resp_go = ctrl_resp_vld && ctrl_resp_rdy;
  
  wire store_req;
  wire load_req;
  wire cc_req;
  
  assign store_req = (ctrl_funct == 0) ? 1'b1 : 1'b0;
  assign load_req  = (ctrl_funct == 1) ? 1'b1 : 1'b0;
  assign cc_req    = (ctrl_funct == 2) ? 1'b1 : 1'b0;
  
  wire ctrl_mem_go;
  wire ctrl_mem_back;
  
  assign ctrl_mem_go   = ctrl_mem_req_rdy && ctrl_mem_req_vld;
  assign ctrl_mem_back = ctrl_mem_resp_vld;

  always @ (*) begin
    case ( state_reg )
      STATE_IDLE: 
        begin
          if (ctrl_cmd_go && store_req) begin
            next_state = STATE_STORE;
          end else begin
            if (ctrl_cmd_go && load_req) begin
              next_state = STATE_LOAD;
            end else begin
              if (ctrl_cmd_go && cc_req) begin
                next_state = STATE_CC;
              end else begin
                next_state = state_reg;
              end
            end
          end
        end
      STATE_STORE:
        begin
          if (ctrl_mem_go) begin
            next_state = STATE_STORE_WAIT;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_STORE_WAIT:
        begin
          if (ctrl_mem_back) begin
            next_state = STATE_DONE;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_LOAD:
        begin
          if (ctrl_mem_go) begin
            next_state = STATE_LOAD_WAIT;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_LOAD_WAIT:
        begin
          if (ctrl_mem_back) begin
            next_state = STATE_DONE;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_DONE: 
        begin
          if (ctrl_resp_go) begin
            next_state = STATE_IDLE;
          end else begin
            next_state = state_reg;
          end
        end
      STATE_CC:
        begin
          next_state = STATE_DONE; // CC will surely be done in one cycle because it's COMBINATIONAL
        end
    endcase
  end
  
  // State Outputs
  parameter sel_load          = 1'b0;
  parameter sel_store         = 1'b1;
  parameter sel_cc_rd         = 1'b0;
  parameter sel_mem_rd        = 1'b1;
  parameter sel_cc_resp_data  = 1'b0;
  parameter sel_mem_resp_data = 1'b1;
  
  always @ (*) begin
    case ( state_reg )
      STATE_IDLE:
        begin
          ctrl_cmd_rdy       = 1'b1;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b0;
          ctrl_mem_req_cmd   = 5'bx;
          ctrl_rd_sel        = 1'bx;
          ctrl_resp_data_sel = 1'bx;
          ctrl_mem_resp_sel  = 1'bx;
          ctrl_cc_done       = 1'b0;
        end
      STATE_STORE:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b1;
          ctrl_mem_req_cmd   = 5'b1;
          ctrl_rd_sel        = sel_mem_rd;
          ctrl_resp_data_sel = sel_mem_resp_data;
          ctrl_mem_resp_sel  = sel_store;
          ctrl_cc_done       = 1'b0;
        end
      STATE_STORE_WAIT:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b0;
          ctrl_mem_req_cmd   = 5'bx;
          ctrl_rd_sel        = sel_mem_rd;
          ctrl_resp_data_sel = sel_mem_resp_data;
          ctrl_mem_resp_sel  = sel_store;
          ctrl_cc_done       = 1'b0;
        end  
      STATE_LOAD:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b1;
          ctrl_mem_req_cmd   = 5'b0;
          ctrl_rd_sel        = sel_mem_rd;
          ctrl_resp_data_sel = sel_mem_resp_data;
          ctrl_mem_resp_sel  = sel_load;
          ctrl_cc_done       = 1'b0;
        end
      STATE_LOAD_WAIT:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b0;
          ctrl_mem_req_cmd   = 5'bx;
          ctrl_rd_sel        = sel_mem_rd;
          ctrl_resp_data_sel = sel_mem_resp_data;
          ctrl_mem_resp_sel  = sel_load;
          ctrl_cc_done       = 1'b0;
        end
      STATE_DONE:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b1;
          ctrl_mem_req_vld   = 1'b0;
          ctrl_mem_req_cmd   = 5'bx;
          ctrl_rd_sel        = 1'bx;
          ctrl_resp_data_sel = 1'bx;
          ctrl_mem_resp_sel  = 1'bx;
          ctrl_cc_done       = 1'b0;
        end
      STATE_CC:
        begin
          ctrl_cmd_rdy       = 1'b0;
          ctrl_resp_vld      = 1'b0;
          ctrl_mem_req_vld   = 1'b0;
          ctrl_mem_req_cmd   = 5'bx;
          ctrl_rd_sel        = sel_cc_rd;
          ctrl_resp_data_sel = sel_cc_resp_data;
          ctrl_mem_resp_sel  = 1'bx;
          ctrl_cc_done       = 1'b1;
        end
    endcase
  end

endmodule
  
