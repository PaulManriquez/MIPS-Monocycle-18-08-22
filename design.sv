//The goal is to design the datapath of the MIPS Monocycle
//From the book Computer organization and design David A. Patterson
//Page 271
//Programmer: Paul Manriquez
//Date: 17/08/2022

`include "PC.sv"
`include "Adder.sv"
`include "Mux2to1.sv"
`include "InstMem.sv"
`include "RegFile.sv"
`include "Mux2to1_4b.sv"
`include "SignExt.sv"
`include "Control.sv"
`include "ALU_CTL.sv"
`include "ALU.sv"
`include "DataMem.sv"
module DataPath(
input clk,rst
);
  
  wire 	[31:0]OMB,outPC,outAdd1,OAB,OutSE,Inst,Data,OMJ;
  wire	[31:0]OutDataMem,RsData,RtData,OutMux,OutALU;
  wire 	[4:0]WriteReg;
  wire  [2:0]ctl_out;
  //Control signals
  wire OutAnd;
  wire Zero;
  wire OutXor;
  
  wire 	RegDst;
  wire	Branch;
  wire	XorBne;
  wire  MemToReg;
  wire  [2:0]ALUOp;
  wire  MemWrite;
  wire	ALUSrc;
  wire	RegWE;
  wire  Jump;
  //--------------------
  
  PC			u0(OMJ,clk,rst,outPC);
  Adder 		u1(32'b1,outPC,outAdd1);
  Adder     	u2(outAdd1,OutSE,OAB);
  Mux2to1   	u3(outAdd1,OAB,OutAnd,OMB);
  Mux2to1		u14(OMB,{6'b000000,Inst[25:0]},Jump,OMJ);
  InstMem 		u4(outPC,Inst);
  Mux2to1_4b	u5(Inst[20:16],Inst[15:11],RegDst,WriteReg);
  // ---------------------//         //OUTMuxDATAMEM(RAM)/RS/-----RsData            RT    RtData     
  RegFile   	u6(clk,RegWE,WriteReg,Data,Inst[25:21],RsData,/**/ Inst[20:16],RtData);
  SignExt   	u7(Inst[15:0],OutSE);
  Control		u8(Inst[31:26],RegDst,Branch,XorBne,MemToReg,ALUOp,MemWrite,ALUSrc,RegWE,Jump);
  ALU_CTL   	u9(Inst[5:0],ALUOp,ctl_out);
  
  Mux2to1   	u10(RtData,OutSE,ALUSrc,OutMux);
  ALU       	u11(ctl_out,RsData,OutMux,OutALU,Zero);
  
  xor(OutXor,Zero,XorBne);
  and(OutAnd,OutXor,Branch);
  
  DataMem       u12(clk,MemWrite,OutALU,RtData,OutDataMem);
  Mux2to1		u13(OutALU,OutDataMem,MemToReg,Data);
  
endmodule
