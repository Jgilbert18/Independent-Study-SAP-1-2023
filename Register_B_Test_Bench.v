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
    bin = 0;
    
   //Reset register
   #10 nLb = 0;
   
   //Loading data into Register B
   #10 bin = 8'd0;
   #10 bin = 8'd1;
   #10 bin = 8'd2;
   #10 bin = 8'd3;
   #10 nLb = 1;
   #10 bin = 8'd4;
   #10 bin = 8'd5;
   #10 bin = 8'd6;
   #10 nLb = 0;
   #10 bin = 8'd7;
   #10 bin = 8'd8;
   #10 bin = 8'd9;
   $stop;
 
  end

endmodule