module Mux2to1_4b ( 
  input 	[4:0] X, Y,
  input 	Sel,
  output	[4:0] Z
);

assign Z = (Sel == 1'b0 ) ? X :
           (Sel == 1'b1 ) ? Y :
           1'bX;

endmodule