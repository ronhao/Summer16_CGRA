#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("io_cmd_V", 160, hls_in, 0, "ap_hs", "in_data", 1),
	Port_Property("io_cmd_V_ap_vld", 1, hls_in, 0, "ap_hs", "in_vld", 1),
	Port_Property("io_cmd_V_ap_ack", 1, hls_out, 0, "ap_hs", "in_acc", 1),
	Port_Property("io_resp_V", 74, hls_out, 1, "ap_hs", "out_data", 1),
	Port_Property("io_resp_V_ap_vld", 1, hls_out, 1, "ap_hs", "out_vld", 1),
	Port_Property("io_resp_V_ap_ack", 1, hls_in, 1, "ap_hs", "out_acc", 1),
};
const char* HLS_Design_Meta::dut_name = "sub10";
