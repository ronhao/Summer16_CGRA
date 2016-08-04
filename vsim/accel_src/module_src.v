module vc_Adder
#(
  parameter p_nbits = 1
)(
  in0,
  in1,
  out
);

  input  [p_nbits-1:0] in0;
  input  [p_nbits-1:0] in1;
  output [p_nbits-1:0] out;

  assign out = in0 + in1;

endmodule
