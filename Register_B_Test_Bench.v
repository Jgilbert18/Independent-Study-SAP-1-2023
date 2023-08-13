`timescale 1ns/100ps

module Register_B_Test_Bench();
  reg CLK, nLb; //Inputs from the block diagram
  reg [7:0] bin; //8 bits from W bus

  wire [7:0] bout; //8 bits going to Adder/Subtractor
  
  Register_B TB(.nLb(nLb), .CLK(CLK), .bin(bin), .bout(bout));
  
  //Clock Generation
  always begin
    #5 CLK = ~CLK;
  end
  
  initial begin
    CLK = 0;
    nLb = 1;
    bin = 8'b00000000;
   
   //Loading data into Register B
   #10 nLb = 0;
   #10 bin = 8'b00000000;
   #10 bin = 8'b00000001;
   #10 bin = 8'b00000010;
   #10 bin = 8'b00000011;
   #10 nLb = 1;
   #10 bin = 8'b00000100;
   #10 bin = 8'b00000101;
   #10 bin = 8'b00000110;
   #10 nLb = 0;
   #10 bin = 8'b00000111;
   #10 bin = 8'd00001000;
   #10 bin = 8'd00001001;
   $stop;
 
  end

endmodule
