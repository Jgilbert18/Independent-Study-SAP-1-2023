module Accumulator_A (CLK, nLa, Ea, aout, ain, atemp);
input CLK, nLa, Ea; //Inputs from the block diagram
input [7:0] ain;    //8 bits from W bus

output [7:0] aout, atemp;  //cout is the 8 bits going back to W bus
                      
reg [7:0] aout, atemp;     //temp is the 8 bits going to the Adder/Subtractor

always @(posedge CLK)

 begin 
  if(!nLa)   //When nLa is low the accumulator is receiving data from the W bus or sending data to the Adder/Subtractor 
    begin
      atemp <= ain; 
      aout <= 8'bz; 
  end
  
  if(Ea)  //When Ea is high the 8 bits appear on the the W bus
    begin
      aout <= atemp;  
  end
 end
  
endmodule