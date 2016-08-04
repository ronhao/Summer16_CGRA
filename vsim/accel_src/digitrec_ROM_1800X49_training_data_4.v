// Generated by stratus_vlg 15.21-p100  (11111646)
// Tue Aug  2 19:14:48 2016
// from c_parts/digitrec_ROM_1800X49_training_data_4.cc

`timescale 1ps / 1ps

      
// Generated by stratus_hls 15.21-p100  (11111647)
// Tue Aug  2 19:14:24 2016
// from digitrec.cc
/* Include declarations of instantiated parts. */
/* Declaration of the synthesized module. */
module digitrec_ROM_1800X49_training_data_4(in1, out1, clk);

      input [10:0] in1;
      input clk;
      output [48:0] out1;
      reg [48:0] out1;
      reg[48:0] training_data_4[1799:0];

         // Generated by stratus_hls 15.21-p100  (11111647)
         // Tue Aug  2 19:14:24 2016
         // from digitrec.cc
         initial begin
            //$readmemh("digitrec_v_rtl/withou_mem_version/digitrec_ROM_1800X49_training_data_4_5.memh", training_data_4);
         end

         always @(posedge clk)
          begin :thread_160
            if (in1 < 11'd1800) begin
               out1 <= training_data_4[in1];
            end
         end


endmodule

