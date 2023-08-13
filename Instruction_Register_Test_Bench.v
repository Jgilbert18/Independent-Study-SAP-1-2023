`timescale 1ns/100ps

module Instruction_Register_Test_Bench();
  reg CLK, nLi, nEi, CLR; //Inputs from the block diagram
  reg [7:0] wbus;         //8 bits from W bus

  wire [3:0]  wbuslower, opcode; //4 bits that go to W bus or Controller/Sequencer
  
  Instruction_Register TB(.nLi(nLi), .nEi(nEi), .CLK(CLK), .CLR(CLR), .wbus(wbus), .wbuslower(wbuslower), .opcode(opcode));
 
  //Clock Generation
  always begin
    #5 CLK = ~CLK;
  end
  
  initial begin
    CLK = 0;
    nLi = 1;
    nEi = 0;
    CLR = 1;
    wbus = 8'b00000000;
        
   //Reset register
   #10 CLR = 0;
   #10 CLR = 1;
   
   //Loading data into Register
   #10 nLi = 0;
   wbus = 8'b00000010; // Input data
   #10 nLi = 1;
   #10 nEi = 1;
   #10 CLR = 0;
   #10 CLR = 1;
   #10 nLi = 0;
   wbus = 8'b00000100; // Input data
   #10 nLi = 1; 
   
   // Simulate data output to Controller/Sequencer
   #10 nEi = 0;
   #10 nLi = 0;
   wbus = 8'b00001000; // Input data
   #10 nEi = 1;
   wbus = 8'b00010000; // Input data
   $stop;
 
  end

endmodule
