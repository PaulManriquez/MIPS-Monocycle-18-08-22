module ALU_CTL(
  input  [5:0]OpCode,
  input  [2:0]To_ctl_ALU,
  output reg [2:0]ctl_out 
);
  
  always @(OpCode,To_ctl_ALU)
    if(To_ctl_ALU == 3'b000) begin //It means that is an R instruction
      case ({To_ctl_ALU,OpCode}) 
        9'b000100000: ctl_out = 3'b000;    //MIPS OP ADD
        9'b000100010: ctl_out = 3'b001;    //MIPS OP SUB
        9'b000100100: ctl_out = 3'b010;    //MIPS OP AND
        9'b000100101: ctl_out = 3'b011;    //MIPS OP OR
        9'b000101010: ctl_out = 3'b100;    //MIPS OP SLT
      endcase
    end else begin
      case(To_ctl_ALU)//I instruction
          3'b001: ctl_out=3'b000;  //MIPS OP ADD   LW
          3'b010: ctl_out=3'b000;  //MIPS OP ADD   SW 
          //3'b011: ctl_out=3'b001;  //MIPS OP SUB   BEQ
          3'b100: ctl_out=3'b001;  //MIPS OP SUB   BNE
          //3'b101: ctl_out=3'b111;  // MIPS J
      endcase
  end

endmodule
      