// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.3
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#include "gcd.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic gcd::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic gcd::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<3> gcd::ap_ST_st1_fsm_0 = "1";
const sc_lv<3> gcd::ap_ST_st2_fsm_1 = "10";
const sc_lv<3> gcd::ap_ST_st3_fsm_2 = "100";
const sc_lv<32> gcd::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<1> gcd::ap_const_lv1_1 = "1";
const sc_lv<32> gcd::ap_const_lv32_1 = "1";
const sc_lv<1> gcd::ap_const_lv1_0 = "0";
const sc_lv<32> gcd::ap_const_lv32_2 = "10";
const sc_lv<32> gcd::ap_const_lv32_14 = "10100";
const sc_lv<32> gcd::ap_const_lv32_18 = "11000";
const sc_lv<32> gcd::ap_const_lv32_20 = "100000";
const sc_lv<32> gcd::ap_const_lv32_5F = "1011111";
const sc_lv<32> gcd::ap_const_lv32_60 = "1100000";
const sc_lv<32> gcd::ap_const_lv32_9F = "10011111";
const sc_lv<5> gcd::ap_const_lv5_0 = "00000";

gcd::gcd(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_a_V_1_fu_128_p2);
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( p_1_reg_77 );

    SC_METHOD(thread_a_V_2_fu_140_p3);
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( tmp_2_fu_122_p2 );
    sensitive << ( a_V_1_fu_128_p2 );

    SC_METHOD(thread_ap_sig_bdd_24);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_bdd_41);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_bdd_60);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_cseq_ST_st1_fsm_0);
    sensitive << ( ap_sig_bdd_24 );

    SC_METHOD(thread_ap_sig_cseq_ST_st2_fsm_1);
    sensitive << ( ap_sig_bdd_41 );

    SC_METHOD(thread_ap_sig_cseq_ST_st3_fsm_2);
    sensitive << ( ap_sig_bdd_60 );

    SC_METHOD(thread_ap_sig_ioackin_io_resp_V_ap_ack);
    sensitive << ( io_resp_V_ap_ack );
    sensitive << ( ap_reg_ioackin_io_resp_V_ap_ack );

    SC_METHOD(thread_b_V_1_fu_134_p2);
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( p_1_reg_77 );

    SC_METHOD(thread_b_V_2_fu_148_p3);
    sensitive << ( p_1_reg_77 );
    sensitive << ( tmp_2_fu_122_p2 );
    sensitive << ( b_V_1_fu_134_p2 );

    SC_METHOD(thread_io_cmd_V_ap_ack);
    sensitive << ( io_cmd_V_ap_vld );
    sensitive << ( ap_sig_cseq_ST_st1_fsm_0 );

    SC_METHOD(thread_io_resp_V);
    sensitive << ( tmp_rd_V_reg_166 );
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( ap_sig_cseq_ST_st3_fsm_2 );

    SC_METHOD(thread_io_resp_V_ap_vld);
    sensitive << ( ap_sig_cseq_ST_st3_fsm_2 );
    sensitive << ( ap_reg_ioackin_io_resp_V_ap_ack );

    SC_METHOD(thread_tmp_2_fu_122_p2);
    sensitive << ( ap_sig_cseq_ST_st2_fsm_1 );
    sensitive << ( tmp_fu_116_p2 );
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( p_1_reg_77 );

    SC_METHOD(thread_tmp_fu_116_p2);
    sensitive << ( ap_sig_cseq_ST_st2_fsm_1 );
    sensitive << ( tmp_data_V_reg_67 );
    sensitive << ( p_1_reg_77 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( io_cmd_V_ap_vld );
    sensitive << ( ap_CS_fsm );
    sensitive << ( tmp_fu_116_p2 );
    sensitive << ( ap_sig_ioackin_io_resp_V_ap_ack );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    ap_CS_fsm = "001";
    ap_reg_ioackin_io_resp_V_ap_ack = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "gcd_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, io_cmd_V, "(port)io_cmd_V");
    sc_trace(mVcdFile, io_cmd_V_ap_vld, "(port)io_cmd_V_ap_vld");
    sc_trace(mVcdFile, io_cmd_V_ap_ack, "(port)io_cmd_V_ap_ack");
    sc_trace(mVcdFile, io_resp_V, "(port)io_resp_V");
    sc_trace(mVcdFile, io_resp_V_ap_vld, "(port)io_resp_V_ap_vld");
    sc_trace(mVcdFile, io_resp_V_ap_ack, "(port)io_resp_V_ap_ack");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, tmp_rd_V_reg_166, "tmp_rd_V_reg_166");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st1_fsm_0, "ap_sig_cseq_ST_st1_fsm_0");
    sc_trace(mVcdFile, ap_sig_bdd_24, "ap_sig_bdd_24");
    sc_trace(mVcdFile, a_V_2_fu_140_p3, "a_V_2_fu_140_p3");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st2_fsm_1, "ap_sig_cseq_ST_st2_fsm_1");
    sc_trace(mVcdFile, ap_sig_bdd_41, "ap_sig_bdd_41");
    sc_trace(mVcdFile, tmp_fu_116_p2, "tmp_fu_116_p2");
    sc_trace(mVcdFile, b_V_2_fu_148_p3, "b_V_2_fu_148_p3");
    sc_trace(mVcdFile, tmp_data_V_reg_67, "tmp_data_V_reg_67");
    sc_trace(mVcdFile, p_1_reg_77, "p_1_reg_77");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st3_fsm_2, "ap_sig_cseq_ST_st3_fsm_2");
    sc_trace(mVcdFile, ap_sig_bdd_60, "ap_sig_bdd_60");
    sc_trace(mVcdFile, ap_reg_ioackin_io_resp_V_ap_ack, "ap_reg_ioackin_io_resp_V_ap_ack");
    sc_trace(mVcdFile, ap_sig_ioackin_io_resp_V_ap_ack, "ap_sig_ioackin_io_resp_V_ap_ack");
    sc_trace(mVcdFile, tmp_2_fu_122_p2, "tmp_2_fu_122_p2");
    sc_trace(mVcdFile, a_V_1_fu_128_p2, "a_V_1_fu_128_p2");
    sc_trace(mVcdFile, b_V_1_fu_134_p2, "b_V_1_fu_134_p2");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
    mHdltvinHandle.open("gcd.hdltvin.dat");
    mHdltvoutHandle.open("gcd.hdltvout.dat");
}

gcd::~gcd() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
}

void gcd::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_st1_fsm_0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_reg_ioackin_io_resp_V_ap_ack = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read())) {
            if (!esl_seteq<1,1,1>(ap_const_logic_0, ap_sig_ioackin_io_resp_V_ap_ack.read())) {
                ap_reg_ioackin_io_resp_V_ap_ack = ap_const_logic_0;
            } else if (esl_seteq<1,1,1>(ap_const_logic_1, io_resp_V_ap_ack.read())) {
                ap_reg_ioackin_io_resp_V_ap_ack = ap_const_logic_1;
            }
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read()) && 
         esl_seteq<1,1,1>(tmp_fu_116_p2.read(), ap_const_lv1_0))) {
        p_1_reg_77 = b_V_2_fu_148_p3.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()) && 
                !esl_seteq<1,1,1>(io_cmd_V_ap_vld.read(), ap_const_logic_0))) {
        p_1_reg_77 = io_cmd_V.read().range(159, 96);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read()) && 
         esl_seteq<1,1,1>(tmp_fu_116_p2.read(), ap_const_lv1_0))) {
        tmp_data_V_reg_67 = a_V_2_fu_140_p3.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()) && 
                !esl_seteq<1,1,1>(io_cmd_V_ap_vld.read(), ap_const_logic_0))) {
        tmp_data_V_reg_67 = io_cmd_V.read().range(95, 32);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()) && !esl_seteq<1,1,1>(io_cmd_V_ap_vld.read(), ap_const_logic_0))) {
        tmp_rd_V_reg_166 = io_cmd_V.read().range(24, 20);
    }
}

void gcd::thread_a_V_1_fu_128_p2() {
    a_V_1_fu_128_p2 = (!tmp_data_V_reg_67.read().is_01() || !p_1_reg_77.read().is_01())? sc_lv<64>(): (sc_biguint<64>(tmp_data_V_reg_67.read()) - sc_biguint<64>(p_1_reg_77.read()));
}

void gcd::thread_a_V_2_fu_140_p3() {
    a_V_2_fu_140_p3 = (!tmp_2_fu_122_p2.read()[0].is_01())? sc_lv<64>(): ((tmp_2_fu_122_p2.read()[0].to_bool())? a_V_1_fu_128_p2.read(): tmp_data_V_reg_67.read());
}

void gcd::thread_ap_sig_bdd_24() {
    ap_sig_bdd_24 = esl_seteq<1,1,1>(ap_CS_fsm.read().range(0, 0), ap_const_lv1_1);
}

void gcd::thread_ap_sig_bdd_41() {
    ap_sig_bdd_41 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(1, 1));
}

void gcd::thread_ap_sig_bdd_60() {
    ap_sig_bdd_60 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(2, 2));
}

void gcd::thread_ap_sig_cseq_ST_st1_fsm_0() {
    if (ap_sig_bdd_24.read()) {
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    }
}

void gcd::thread_ap_sig_cseq_ST_st2_fsm_1() {
    if (ap_sig_bdd_41.read()) {
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    }
}

void gcd::thread_ap_sig_cseq_ST_st3_fsm_2() {
    if (ap_sig_bdd_60.read()) {
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    }
}

void gcd::thread_ap_sig_ioackin_io_resp_V_ap_ack() {
    if (esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_io_resp_V_ap_ack.read())) {
        ap_sig_ioackin_io_resp_V_ap_ack = io_resp_V_ap_ack.read();
    } else {
        ap_sig_ioackin_io_resp_V_ap_ack = ap_const_logic_1;
    }
}

void gcd::thread_b_V_1_fu_134_p2() {
    b_V_1_fu_134_p2 = (!p_1_reg_77.read().is_01() || !tmp_data_V_reg_67.read().is_01())? sc_lv<64>(): (sc_biguint<64>(p_1_reg_77.read()) - sc_biguint<64>(tmp_data_V_reg_67.read()));
}

void gcd::thread_b_V_2_fu_148_p3() {
    b_V_2_fu_148_p3 = (!tmp_2_fu_122_p2.read()[0].is_01())? sc_lv<64>(): ((tmp_2_fu_122_p2.read()[0].to_bool())? p_1_reg_77.read(): b_V_1_fu_134_p2.read());
}

void gcd::thread_io_cmd_V_ap_ack() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()) && 
         !esl_seteq<1,1,1>(io_cmd_V_ap_vld.read(), ap_const_logic_0))) {
        io_cmd_V_ap_ack = ap_const_logic_1;
    } else {
        io_cmd_V_ap_ack = ap_const_logic_0;
    }
}

void gcd::thread_io_resp_V() {
    io_resp_V = esl_concat<69,5>(esl_concat<64,5>(tmp_data_V_reg_67.read(), tmp_rd_V_reg_166.read()), ap_const_lv5_0);
}

void gcd::thread_io_resp_V_ap_vld() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, ap_reg_ioackin_io_resp_V_ap_ack.read()))) {
        io_resp_V_ap_vld = ap_const_logic_1;
    } else {
        io_resp_V_ap_vld = ap_const_logic_0;
    }
}

void gcd::thread_tmp_2_fu_122_p2() {
    tmp_2_fu_122_p2 = (!tmp_data_V_reg_67.read().is_01() || !p_1_reg_77.read().is_01())? sc_lv<1>(): (sc_biguint<64>(tmp_data_V_reg_67.read()) > sc_biguint<64>(p_1_reg_77.read()));
}

void gcd::thread_tmp_fu_116_p2() {
    tmp_fu_116_p2 = (!tmp_data_V_reg_67.read().is_01() || !p_1_reg_77.read().is_01())? sc_lv<1>(): sc_lv<1>(tmp_data_V_reg_67.read() == p_1_reg_77.read());
}

void gcd::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if (!esl_seteq<1,1,1>(io_cmd_V_ap_vld.read(), ap_const_logic_0)) {
                ap_NS_fsm = ap_ST_st2_fsm_1;
            } else {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            }
            break;
        case 2 : 
            if (esl_seteq<1,1,1>(tmp_fu_116_p2.read(), ap_const_lv1_0)) {
                ap_NS_fsm = ap_ST_st2_fsm_1;
            } else {
                ap_NS_fsm = ap_ST_st3_fsm_2;
            }
            break;
        case 4 : 
            if (!esl_seteq<1,1,1>(ap_const_logic_0, ap_sig_ioackin_io_resp_V_ap_ack.read())) {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            } else {
                ap_NS_fsm = ap_ST_st3_fsm_2;
            }
            break;
        default : 
            ap_NS_fsm = "XXX";
            break;
    }
}

void gcd::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"io_cmd_V\" :  \"" << io_cmd_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"io_cmd_V_ap_vld\" :  \"" << io_cmd_V_ap_vld.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"io_cmd_V_ap_ack\" :  \"" << io_cmd_V_ap_ack.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"io_resp_V\" :  \"" << io_resp_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"io_resp_V_ap_vld\" :  \"" << io_resp_V_ap_vld.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"io_resp_V_ap_ack\" :  \"" << io_resp_V_ap_ack.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

