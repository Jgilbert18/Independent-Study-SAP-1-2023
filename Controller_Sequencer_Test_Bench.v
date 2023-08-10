`timescale 1ns/100ps

module Controller_Sequencer_Test_Bench;

  reg CLK, CLR;
  reg [3:0] opcode;
  
  wire [11:0] cntrl_bus;

  Controller_Sequencer TB(.CLK(CLK), .CLR(CLR), .cntrl_bus(cntrl_bus), .opcode(opcode));

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

  // Initial block for simulation setup
  initial begin
    CLK = 0;
    CLR = 1; // Set CLR high for now
    opcode = 4'b0000;

    // Reset the Control Unit
    #10 CLR = 0;
    #10 CLR = 1;

    // Simulate different opcodes and states
    #20 opcode = 4'b0000; // Example opcode for LDA
    #20 opcode = 4'b0001; // Example opcode for ADD
    #20 opcode = 4'b0010; // Example opcode for SUB
    #10 CLR = 0;
    #10 CLR = 1;
    #20 opcode = 4'b1110; // Example opcode for OUT
    #20 opcode = 4'b1111; // Example opcode for HLT
    $stop;
  
  end

endmodule
