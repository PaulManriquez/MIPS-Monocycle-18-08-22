module Mux2to1 ( 
  input 	[31:0] X, Y,
  input 	Sel,
  output	[31:0] Z
);

assign Z = (Sel == 1'b0 ) ? X :
           (Sel == 1'b1 ) ? Y :
           1'bX;

endmodule