module Adder(
  input [31:0]SreA,
  input [31:0]SreB,
  output [31:0]Result
);

  assign Result = SreA + SreB;
  
endmodule