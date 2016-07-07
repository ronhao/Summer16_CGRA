#open_project sub3_syn_pipe_cbe
open_project sub3

add_files sub3.cpp
add_files -tb sub3.cpp

set_top sub3

open_solution -reset solution
set_part zynq
create_clock -period 5

set_directive_interface -mode ap_ctrl_none sub3
set_directive_interface -mode ap_hs sub3 io_cmd
set_directive_interface -mode ap_hs sub3 io_resp

csim_design
csynth_design
#cosim_design -rtl verilog -tool modelsim 

exit
