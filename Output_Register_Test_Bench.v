`timescale 1ns/100ps

module Output_Register_Test_Bench();
  reg CLK, nLo; //Inputs from the block diagram
  reg [7:0] orin; //8 bits from W bus

  wire [7:0] display; //8 bits going to Adder/Subtractor
  
  Output_Register TB(.nLo(nLo), .CLK(CLK), .orin(orin), .display(display));
  
  //Clock Generation
  always begin
    #5 CLK = ~CLK;
  end
  
  initial begin
    CLK = 0;
    nLo = 1;
    orin = 8'b00000000;
   
   //Loading data into Register
   #10 nLo = 0;
   #10 orin = 8'b00000001;
   #10 orin = 8'b00000011;
   #10 orin = 8'b00000101;
   #10 orin = 8'b00000111;
   #10 nLo = 1;
   #10 orin = 8'b00001011;
   #10 orin = 8'b00001101;
   #10 nLo = 0;
   #10 orin = 8'b00010001;
   #10 nLo = 1;
   #10 orin = 8'b00010011;
   #10 orin = 8'b00010111;
   #10 orin = 8'b00011101;
   $stop;
 
  end

endmodule
