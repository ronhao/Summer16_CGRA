#open_project gcd_syn_pipe_cbe
open_project gcd

add_files gcd.cpp
add_files -tb gcd.cpp

set_top gcd

open_solution -reset solution
set_part zynq
create_clock -period 5

set_directive_interface -mode ap_ctrl_none gcd
set_directive_interface -mode ap_hs gcd io_cmd
set_directive_interface -mode ap_hs gcd io_resp

csim_design
csynth_design
#cosim_design -rtl verilog -tool modelsim 

exit
