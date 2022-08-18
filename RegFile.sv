module RegFile (  
  
  input                    clk,                                      
    
  input                    we,                   
  input          [4:0]     rd_addr,  //RT Destino            
  input          [31:0]    rd_data,  //Dato resultante de la RAM(A constant could be added to DUT)              
    
  input          [4:0]     rs_addr,  //RS             
  output         [31:0]    rs_data,  //Una salida a la ALU (RSDATA_Diagram)       
     
  input          [4:0]     rt_addr,  //Rt Address
  output         [31:0]    rt_data  //Rt Data
 );  
 
  reg [31:0] reg_File [0:31];  // 32 bit memory with 32 entries = 5 bits  
 
    initial begin 
      $readmemb("Reg_file.txt", reg_File);
    end
    
/*--------------------------- Save Data -----------------------------*/
      always @ (posedge clk) begin   
        if(we) begin                         
        	reg_File[rd_addr] <= rd_data; 
          $writememb("Reg_file.txt", reg_File);
        end  
      end  
/*------------------ Get data from register ------------------------*/
 
  assign rs_data = reg_File[rs_addr];
  assign rt_data = reg_File[rt_addr];
 
 endmodule