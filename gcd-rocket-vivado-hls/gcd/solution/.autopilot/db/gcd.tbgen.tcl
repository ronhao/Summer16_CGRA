set C_TypeInfoList {{ 
"gcd" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"io_cmd": [[], {"reference": "0"}] }, {"io_resp": [[], {"reference": "1"}] }],[],""], 
"0": [ "stream<CMD>", {"hls_type": {"stream": [[[[],"2"]],"3"]}}], 
"2": [ "CMD", {"struct": [[],[],[{ "inst_funct": [[], "4"]},{ "inst_rs2": [[], "5"]},{ "inst_rs1": [[], "5"]},{ "inst_xd": [[], "6"]},{ "inst_xs1": [[], "6"]},{ "inst_xs2": [[], "6"]},{ "inst_rd": [[], "5"]},{ "inst_opcode": [[], "4"]},{ "rs1": [[], "7"]},{ "rs2": [[], "7"]}],""]}], 
"5": [ "ap_uint<5>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 5}}]],""]}}], 
"6": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"7": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"1": [ "stream<RESP>", {"hls_type": {"stream": [[[[],"8"]],"3"]}}], 
"8": [ "RESP", {"struct": [[],[],[{ "io_busy": [[], "6"]},{ "io_interrupt": [[], "6"]},{ "io_autl_acquire_ready": [[], "6"]},{ "io_autl_acquire_valid": [[], "6"]},{ "io_mem_req_valid": [[], "6"]},{ "rd": [[], "5"]},{ "data": [[], "7"]}],""]}], 
"4": [ "ap_uint<7>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 7}}]],""]}}],
"3": ["hls", ""]
}}
set moduleName gcd
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set C_modelName {gcd}
set C_modelType { void 0 }
set C_modelArgList { 
	{ io_cmd_V int 160 regular {pointer 0 volatile }  }
	{ io_resp_V int 74 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "io_cmd_V", "interface" : "wire", "bitwidth" : 160, "direction" : "READONLY", "bitSlice":[{"low":0,"up":6,"cElement": [{"cName": "io_cmd.V.inst_funct.V","cData": "uint7","bit_use": { "low": 0,"up": 6},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":7,"up":11,"cElement": [{"cName": "io_cmd.V.inst_rs2.V","cData": "uint5","bit_use": { "low": 0,"up": 4},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":12,"up":16,"cElement": [{"cName": "io_cmd.V.inst_rs1.V","cData": "uint5","bit_use": { "low": 0,"up": 4},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":17,"up":17,"cElement": [{"cName": "io_cmd.V.inst_xd.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":18,"up":18,"cElement": [{"cName": "io_cmd.V.inst_xs1.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":19,"up":19,"cElement": [{"cName": "io_cmd.V.inst_xs2.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":20,"up":24,"cElement": [{"cName": "io_cmd.V.inst_rd.V","cData": "uint5","bit_use": { "low": 0,"up": 4},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":25,"up":31,"cElement": [{"cName": "io_cmd.V.inst_opcode.V","cData": "uint7","bit_use": { "low": 0,"up": 6},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":95,"cElement": [{"cName": "io_cmd.V.rs1.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":159,"cElement": [{"cName": "io_cmd.V.rs2.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "io_resp_V", "interface" : "wire", "bitwidth" : 74, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "io_resp.V.io_busy.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":1,"up":1,"cElement": [{"cName": "io_resp.V.io_interrupt.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":2,"up":2,"cElement": [{"cName": "io_resp.V.io_autl_acquire_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":3,"up":3,"cElement": [{"cName": "io_resp.V.io_autl_acquire_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":4,"up":4,"cElement": [{"cName": "io_resp.V.io_mem_req_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":5,"up":9,"cElement": [{"cName": "io_resp.V.rd.V","cData": "uint5","bit_use": { "low": 0,"up": 4},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":10,"up":73,"cElement": [{"cName": "io_resp.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ io_cmd_V sc_in sc_lv 160 signal 0 } 
	{ io_cmd_V_ap_vld sc_in sc_logic 1 invld 0 } 
	{ io_cmd_V_ap_ack sc_out sc_logic 1 inacc 0 } 
	{ io_resp_V sc_out sc_lv 74 signal 1 } 
	{ io_resp_V_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ io_resp_V_ap_ack sc_in sc_logic 1 outacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "io_cmd_V", "direction": "in", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "io_cmd_V", "role": "default" }} , 
 	{ "name": "io_cmd_V_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "io_cmd_V", "role": "ap_vld" }} , 
 	{ "name": "io_cmd_V_ap_ack", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "io_cmd_V", "role": "ap_ack" }} , 
 	{ "name": "io_resp_V", "direction": "out", "datatype": "sc_lv", "bitwidth":74, "type": "signal", "bundle":{"name": "io_resp_V", "role": "default" }} , 
 	{ "name": "io_resp_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "io_resp_V", "role": "ap_vld" }} , 
 	{ "name": "io_resp_V_ap_ack", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "io_resp_V", "role": "ap_ack" }}  ]}
set Spec2ImplPortList { 
	io_cmd_V { ap_hs {  { io_cmd_V in_data 0 160 }  { io_cmd_V_ap_vld in_vld 0 1 }  { io_cmd_V_ap_ack in_acc 1 1 } } }
	io_resp_V { ap_hs {  { io_resp_V out_data 1 74 }  { io_resp_V_ap_vld out_vld 1 1 }  { io_resp_V_ap_ack out_acc 0 1 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
