module Output_Register(nLo, CLK, orin, display);
input CLK, nLo; //Inputs from the block diagram
input [7:0] orin; //8 bits from W bus

output [7:0] display; //8 bits going to Binary Display

reg [7:0] display;  //Registers to hold the data being sent to the Binary Display

always @ (posedge CLK)

begin 
  if(!nLo) //When nLo is low the next CLK edge loads the accumulator word into the output register
    display = orin;
  end
  
endmodule
