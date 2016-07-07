// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.3
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="sub3,hls_ip_2015_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-2,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.800000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=66}" *)

module sub3 (
        ap_clk,
        ap_rst,
        io_cmd_V,
        io_cmd_V_ap_vld,
        io_cmd_V_ap_ack,
        io_resp_V,
        io_resp_V_ap_vld,
        io_resp_V_ap_ack
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_14 = 32'b10100;
parameter    ap_const_lv32_18 = 32'b11000;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv32_5F = 32'b1011111;
parameter    ap_const_lv32_60 = 32'b1100000;
parameter    ap_const_lv32_9E = 32'b10011110;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input  [159:0] io_cmd_V;
input   io_cmd_V_ap_vld;
output   io_cmd_V_ap_ack;
output  [73:0] io_resp_V;
output   io_resp_V_ap_vld;
input   io_resp_V_ap_ack;

reg io_cmd_V_ap_ack;
reg io_resp_V_ap_vld;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_21;
reg    ap_sig_ioackin_io_resp_V_ap_ack;
reg    ap_reg_ioackin_io_resp_V_ap_ack = 1'b0;
wire   [62:0] tmp_2_fu_83_p4;
wire   [63:0] tmp_fu_93_p3;
wire   [63:0] a_V_fu_73_p4;
wire   [63:0] a_V_2_fu_101_p2;
wire   [4:0] tmp_rd_V_fu_63_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_bdd_82;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ioackin_io_resp_V_ap_ack assign process. ///
always @ (posedge ap_clk) begin : ap_ret_ap_reg_ioackin_io_resp_V_ap_ack
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
            if (~((io_cmd_V_ap_vld == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_io_resp_V_ap_ack))) begin
                ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_0;
            end else if (ap_sig_bdd_82) begin
                ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_1;
            end
        end
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_21) begin
    if (ap_sig_bdd_21) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_ioackin_io_resp_V_ap_ack assign process. ///
always @ (io_resp_V_ap_ack or ap_reg_ioackin_io_resp_V_ap_ack) begin
    if ((ap_const_logic_0 == ap_reg_ioackin_io_resp_V_ap_ack)) begin
        ap_sig_ioackin_io_resp_V_ap_ack = io_resp_V_ap_ack;
    end else begin
        ap_sig_ioackin_io_resp_V_ap_ack = ap_const_logic_1;
    end
end

/// io_cmd_V_ap_ack assign process. ///
always @ (io_cmd_V_ap_vld or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_ioackin_io_resp_V_ap_ack) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~((io_cmd_V_ap_vld == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_io_resp_V_ap_ack)))) begin
        io_cmd_V_ap_ack = ap_const_logic_1;
    end else begin
        io_cmd_V_ap_ack = ap_const_logic_0;
    end
end

/// io_resp_V_ap_vld assign process. ///
always @ (io_cmd_V_ap_vld or ap_sig_cseq_ST_st1_fsm_0 or ap_reg_ioackin_io_resp_V_ap_ack) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(io_cmd_V_ap_vld == ap_const_logic_0) & (ap_const_logic_0 == ap_reg_ioackin_io_resp_V_ap_ack))) begin
        io_resp_V_ap_vld = ap_const_logic_1;
    end else begin
        io_resp_V_ap_vld = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (io_cmd_V_ap_vld or ap_CS_fsm or ap_sig_ioackin_io_resp_V_ap_ack) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_V_2_fu_101_p2 = (tmp_fu_93_p3 + a_V_fu_73_p4);
assign a_V_fu_73_p4 = {{io_cmd_V[ap_const_lv32_5F : ap_const_lv32_20]}};

/// ap_sig_bdd_21 assign process. ///
always @ (ap_CS_fsm) begin
    ap_sig_bdd_21 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_82 assign process. ///
always @ (io_cmd_V_ap_vld or io_resp_V_ap_ack) begin
    ap_sig_bdd_82 = (~(io_cmd_V_ap_vld == ap_const_logic_0) & (ap_const_logic_1 == io_resp_V_ap_ack));
end
assign io_resp_V = {{{a_V_2_fu_101_p2}, {tmp_rd_V_fu_63_p4}}, {ap_const_lv5_0}};
assign tmp_2_fu_83_p4 = {{io_cmd_V[ap_const_lv32_9E : ap_const_lv32_60]}};
assign tmp_fu_93_p3 = {{tmp_2_fu_83_p4}, {ap_const_lv1_0}};
assign tmp_rd_V_fu_63_p4 = {{io_cmd_V[ap_const_lv32_18 : ap_const_lv32_14]}};


endmodule //sub3

