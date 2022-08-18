module PC (
  input [31:0]DataIn,
  input clk,
  input Reset,
  output [31:0]DataOut
);
  
reg  [31:0] DataReg;
integer i;
  initial begin 
        for(i = 0; i < 32; i++) begin
          DataReg[i] = 32'b0;//Inicializar en 0
        end
    end

assign DataOut = DataReg;//Como es un cable la asignacion es " = "

  always@(posedge clk or negedge Reset) begin
    if(Reset == 1'b0) 
		DataReg <= 0;
	else 
		DataReg <= DataIn; //Lo que entra es lo que sale 
end
  
endmodule