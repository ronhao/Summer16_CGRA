// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.3
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#ifndef _sub10_HH_
#define _sub10_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct sub10 : public sc_module {
    // Port declarations 8
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_lv<160> > io_cmd_V;
    sc_in< sc_logic > io_cmd_V_ap_vld;
    sc_out< sc_logic > io_cmd_V_ap_ack;
    sc_out< sc_lv<74> > io_resp_V;
    sc_out< sc_logic > io_resp_V_ap_vld;
    sc_in< sc_logic > io_resp_V_ap_ack;


    // Module declarations
    sub10(sc_module_name name);
    SC_HAS_PROCESS(sub10);

    ~sub10();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_sig_cseq_ST_st1_fsm_0;
    sc_signal< bool > ap_sig_bdd_21;
    sc_signal< sc_logic > ap_sig_ioackin_io_resp_V_ap_ack;
    sc_signal< sc_logic > ap_reg_ioackin_io_resp_V_ap_ack;
    sc_signal< sc_lv<64> > a_V_fu_69_p4;
    sc_signal< sc_lv<64> > tmp_fu_89_p2;
    sc_signal< sc_lv<64> > b_V_fu_79_p4;
    sc_signal< sc_lv<64> > a_V_2_fu_95_p2;
    sc_signal< sc_lv<5> > tmp_rd_V_fu_59_p4;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< bool > ap_sig_bdd_82;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_st1_fsm_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_14;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_5F;
    static const sc_lv<32> ap_const_lv32_60;
    static const sc_lv<32> ap_const_lv32_9F;
    static const sc_lv<64> ap_const_lv64_A;
    static const sc_lv<5> ap_const_lv5_0;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_a_V_2_fu_95_p2();
    void thread_a_V_fu_69_p4();
    void thread_ap_sig_bdd_21();
    void thread_ap_sig_bdd_82();
    void thread_ap_sig_cseq_ST_st1_fsm_0();
    void thread_ap_sig_ioackin_io_resp_V_ap_ack();
    void thread_b_V_fu_79_p4();
    void thread_io_cmd_V_ap_ack();
    void thread_io_resp_V();
    void thread_io_resp_V_ap_vld();
    void thread_tmp_fu_89_p2();
    void thread_tmp_rd_V_fu_59_p4();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
