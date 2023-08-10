module Program_Counter(nCLR, nCLK, Cp, Ep, WBus);
input nCLR, nCLK, Cp, Ep; //Inputs from the block diagram

output [3:0] WBus; //4 bits output to W bus

reg [3:0] WBus;  //Register bits to hold onto data to be sent to W bus

always @ (negedge nCLK) //negative edge for nCLK means positive edge for CLK

//Program counter increments every negative CLK edge
begin
  if (Cp == 1) 
    begin
      WBus = WBus + 1;
    end
    
  if (nCLR == 0) //Resets Program Counter
    begin
      WBus = 0;
    end
end  

endmodule
