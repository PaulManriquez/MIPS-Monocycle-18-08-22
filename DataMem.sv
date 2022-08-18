module DataMem(  
  input                    clk,                                      
  //WD 
  input                    	WE,                   
  input          [31:0]     addr_rd,                
  input          [31:0]     data_rd,                
  //RD                
  output         [31:0]     FR_Rdata,         
 );  
 
  //reg [31:0] data_mem [0:31];  // 32 bit memory with 32 entries
  reg [31:0] data_mem [0:120];
    
  initial begin 
      $readmemb("data_mem.txt", data_mem);
    end
    
/*--------------------------- Save Data -----------------------------*/
      always @ (posedge clk) begin   
        if(WE) begin                         
        	data_mem[addr_rd] <= data_rd;    
        $writememb("data_mem.txt", data_mem);
        end  
      end  
/*------------------ Get data from memory ------------------------*/
 
  assign FR_Rdata = data_mem[addr_rd];

 
 endmodule

