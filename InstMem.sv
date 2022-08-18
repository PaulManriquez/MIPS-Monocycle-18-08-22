module InstMem(addr,rd);
  
  input[31:0] addr;// 1,2,3,4...de pc apunta a inst.txt
  output reg [31:0] rd; //La salida es la instruccion a la que apunta
  
  reg [31:0] mem [0:31]; // La memoria se la asigna a la memoria creada mem
  
  initial begin
    $readmemb("Inst.txt", mem); //<<--- aqui
  end
  
  assign rd = mem[addr]; // Sale la instrucion 
  
endmodule

