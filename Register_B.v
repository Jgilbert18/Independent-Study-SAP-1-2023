module Register_B(nLb, CLK, bin, bout);
input CLK, nLb; //Inputs from the block diagram
input [7:0] bin; //8 bits from W bus

output [7:0] bout; //8 bits going to Adder/Subtractor

reg [7:0] bout; //Registers to hold the data going to the Addder/Subtractor

always @ (posedge CLK)

  begin 
  if(!nLb) //When nLb is low and a pos CLK edge loads the word from the W bus into Register B
    bout = bin;
  end

endmodule
