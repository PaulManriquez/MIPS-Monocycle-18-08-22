module Control(
  input 		[5:0]OpCode,
  output reg	RegDst,
  output reg	Branch,
  output reg	XorBne,
  output reg    MemToReg,
  output reg  	[2:0]ALUOp,
  output reg    MemWrite,
  output reg	ALUSrc,
  output reg	RegWE,
  output reg	Jump
);
  
  always@(OpCode)begin 
    case(OpCode)                                 //000 Will tells to ALU Ctl that is an R or I instruction
      6'b000000:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b10000001010;//R type
      6'b100011:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b00010010110;//I type LW
      6'b101011:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b00010101100;//I type SW
      6'b000100:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b01000110000;//I type BEQ
      6'b000101:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b01101000000;//I type BNE
      6'b000010:{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'b01101000001;//J Jump
      default  :{RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump}=11'bzzzzzzzzzzz;
        endcase
    
  end
  
endmodule