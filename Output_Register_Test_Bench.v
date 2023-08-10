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
    orin = 0;
    
   //Reset register
   #10 nLo = 0;
   
   //Loading data into Register
   #10 orin = 8'd1;
   #10 orin = 8'd3;
   #10 orin = 8'd5;
   #10 orin = 8'd7;
   #10 nLo = 1;
   #10 orin = 8'd11;
   #10 orin = 8'd13;
   #10 nLo = 0;
   #10 orin = 8'd17;
   #10 nLo = 1;
   #10 orin = 8'd19;
   #10 orin = 8'd23;
   #10 orin = 8'd29;
   $stop;
 
  end

endmodule
