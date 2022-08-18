`timescale 1ns/1ps
module DataPath_TB;
  	reg 	clk_TB,rst_TB;  
  	integer i;
  DataPath DUT(.clk(clk_TB),.rst(rst_TB)
                     	);
  
  initial begin  
	//---------Reset and clk begin-------- 
   	clk_TB=1'b0; rst_TB=1'b0; #2;
    $display("RESET:%b\n",DUT.Inst);
    rst_TB=1'b1;
    //------------------------------------
    
    for(i=0;i<3;i++)begin 
      if((DUT.Inst[31:26])==6'b100011)begin 
        $display("\t\tLW Instruction");
      end else 
        if ((DUT.Inst[31:26])==6'b101011)begin 
          $display("\t\tSW Instruction");
        end else
          if((DUT.Inst[31:26])==6'b000101)begin 
            $display("\t\tBNE Instruction");
        end 
      else
        if((DUT.Inst[31:26])==6'b000100)begin 
          $display("\t\tBEQ Instruction");
        end else
          if((DUT.Inst[31:26])==6'b000010)begin 
            $display("\t\tJump Instruction");
        end 
      else
            if((DUT.Inst[31:26])==6'b000000)begin 
            if((DUT.Inst[5:0])==6'b100000)begin 
              $display("\t\t R Instruction ADD");
            end else if((DUT.Inst[5:0])==6'b100010)begin 
              $display("\t\t R Instruction SUB");
            end else if ((DUT.Inst[5:0])==6'b100100)begin 
              $display("\t\t R Instruction AND");
            end else if((DUT.Inst[5:0])==6'b100101)begin 
              $display("\t\t R Instruction OR");	
            end else if((DUT.Inst[5:0])==6'b101010)begin 
              $display("\t\t R Instruction SLT");
            end
          
          end
      $display("Instruction:%b",DUT.Inst);
      $display("\t\t  CONTROL");
      $display("RegDst:%b\tBranch:%b\tXorBNE:%b",DUT.RegDst,DUT.Branch,DUT.XorBne);
      $display("MemtoReg:%b\tALUOp:%b\tMemWrite:%b",DUT.MemToReg,DUT.ALUOp,DUT.MemWrite);
      $display("ALUSrc:%b\tRegWrite:%b\tZero:%b",DUT.ALUSrc,DUT.RegWE,DUT.Zero);
      $display("\t\t   Jump:%b",DUT.Jump);
      $display("RSData:%b\nRTData:%b",DUT.RsData,DUT.RtData);
      $display("OutALU:%b\nOutDataMem:%b",DUT.OutALU,DUT.OutDataMem);
      $display("OutALUBranch:%b\n",DUT.OAB);
      #2;
    end
    
    
  $finish;
  end
  
  always #1 clk_TB=~clk_TB;
endmodule
 
