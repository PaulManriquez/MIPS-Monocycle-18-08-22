module SignExt(DataIn, DataOut);

  input [15:0] DataIn; // 16-bit input
  output [31:0] DataOut; // 32-bit output

  assign DataOut = {{ 16{DataIn[15]}}, DataIn };

endmodule