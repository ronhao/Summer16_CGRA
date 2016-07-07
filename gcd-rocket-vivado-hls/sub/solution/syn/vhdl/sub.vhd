-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.3
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sub is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    io_cmd_V : IN STD_LOGIC_VECTOR (159 downto 0);
    io_cmd_V_ap_vld : IN STD_LOGIC;
    io_cmd_V_ap_ack : OUT STD_LOGIC;
    io_resp_V : OUT STD_LOGIC_VECTOR (73 downto 0);
    io_resp_V_ap_vld : OUT STD_LOGIC;
    io_resp_V_ap_ack : IN STD_LOGIC );
end;


architecture behav of sub is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "sub,hls_ip_2015_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-2,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.800000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=66}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_9F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010011111";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_21 : BOOLEAN;
    signal ap_sig_ioackin_io_resp_V_ap_ack : STD_LOGIC;
    signal ap_reg_ioackin_io_resp_V_ap_ack : STD_LOGIC := '0';
    signal a_V_fu_67_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal b_V_fu_77_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal a_V_2_fu_87_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_rd_V_fu_57_p4 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_77 : BOOLEAN;


begin




    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_reg_ioackin_io_resp_V_ap_ack assign process. --
    ap_reg_ioackin_io_resp_V_ap_ack_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then
                    if (not(((io_cmd_V_ap_vld = ap_const_logic_0) or (ap_const_logic_0 = ap_sig_ioackin_io_resp_V_ap_ack)))) then 
                        ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_0;
                    elsif (ap_sig_bdd_77) then 
                        ap_reg_ioackin_io_resp_V_ap_ack <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (io_cmd_V_ap_vld, ap_CS_fsm, ap_sig_ioackin_io_resp_V_ap_ack)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    a_V_2_fu_87_p2 <= std_logic_vector(unsigned(a_V_fu_67_p4) - unsigned(b_V_fu_77_p4));
    a_V_fu_67_p4 <= io_cmd_V(95 downto 32);

    -- ap_sig_bdd_21 assign process. --
    ap_sig_bdd_21_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_21 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_77 assign process. --
    ap_sig_bdd_77_assign_proc : process(io_cmd_V_ap_vld, io_resp_V_ap_ack)
    begin
                ap_sig_bdd_77 <= (not((io_cmd_V_ap_vld = ap_const_logic_0)) and (ap_const_logic_1 = io_resp_V_ap_ack));
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_21)
    begin
        if (ap_sig_bdd_21) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_ioackin_io_resp_V_ap_ack assign process. --
    ap_sig_ioackin_io_resp_V_ap_ack_assign_proc : process(io_resp_V_ap_ack, ap_reg_ioackin_io_resp_V_ap_ack)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_io_resp_V_ap_ack)) then 
            ap_sig_ioackin_io_resp_V_ap_ack <= io_resp_V_ap_ack;
        else 
            ap_sig_ioackin_io_resp_V_ap_ack <= ap_const_logic_1;
        end if; 
    end process;

    b_V_fu_77_p4 <= io_cmd_V(159 downto 96);

    -- io_cmd_V_ap_ack assign process. --
    io_cmd_V_ap_ack_assign_proc : process(io_cmd_V_ap_vld, ap_sig_cseq_ST_st1_fsm_0, ap_sig_ioackin_io_resp_V_ap_ack)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(((io_cmd_V_ap_vld = ap_const_logic_0) or (ap_const_logic_0 = ap_sig_ioackin_io_resp_V_ap_ack))))) then 
            io_cmd_V_ap_ack <= ap_const_logic_1;
        else 
            io_cmd_V_ap_ack <= ap_const_logic_0;
        end if; 
    end process;

    io_resp_V <= ((a_V_2_fu_87_p2 & tmp_rd_V_fu_57_p4) & ap_const_lv5_0);

    -- io_resp_V_ap_vld assign process. --
    io_resp_V_ap_vld_assign_proc : process(io_cmd_V_ap_vld, ap_sig_cseq_ST_st1_fsm_0, ap_reg_ioackin_io_resp_V_ap_ack)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((io_cmd_V_ap_vld = ap_const_logic_0)) and (ap_const_logic_0 = ap_reg_ioackin_io_resp_V_ap_ack))) then 
            io_resp_V_ap_vld <= ap_const_logic_1;
        else 
            io_resp_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_rd_V_fu_57_p4 <= io_cmd_V(24 downto 20);
end behav;
