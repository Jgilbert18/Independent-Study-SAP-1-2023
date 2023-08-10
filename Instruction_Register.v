module Instruction_Register(CLK, nLi, nEi, CLR, wbus, wbuslower, opcode);
input CLK, nLi, nEi, CLR; //Inputs from the block diagram
input [7:0] wbus;  //8 bits from the W bus

output [3:0] wbuslower, opcode;  //4 bits that go to W bus or Controller/Sequencer

reg [7:0] wbusin;  //Registers to hold W bus data being received
reg [3:0] wbusout;  //Registers to hold data to output it to Controller/Sequencer

wire[7:0] wbuslow;  //Connection to W bus

assign opcode = wbusin[7:4];  //Assigning the 4 MSB that come from the W bus to be sent to Controller/Sequencer
assign wbuslow = wbusin[3:0]; //Assigning the 4 LSB to be sent to the W bus


always @ (posedge CLK)
  begin       
    if (CLR)
      begin 
        wbusin = 8'b0; 
        wbusout = 4'bz; //z is a used for tri-state buffer
    end

  else if(!nLi) //When nLi is low it is receiving data from W bus

    begin
      wbusin = wbus; 
      wbusout = 4'bz; 
    end
  
  if (!nEi) //When nEi is low it is sending data from W bus
    begin
      wbusout = wbuslow;
    end
  end

endmodule
