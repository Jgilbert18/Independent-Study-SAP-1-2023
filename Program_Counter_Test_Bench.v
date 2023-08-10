`timescale 1ns/100ps

module Program_Counter_Test_Bench();
  
  reg nCLR, nCLK, Cp, Ep;
   
  wire [3:0] WBus;
  
  Program_Counter TB( .nCLR(nCLR), .nCLK(nCLK), .Cp(Cp), .Ep(Ep), .WBus(WBus));
  
  // Clock generation
  always begin
    #5 nCLK = ~nCLK;
  end

 // Initial block for simulation setup
  initial begin
    nCLR = 1; // Set nCLR high for now
    nCLK = 0;
    Cp = 0;
    Ep = 0;

    // Simulate program counter reset
    #10 nCLR = 0; // Reset Program Counter
    #10 nCLR = 1;

    //Counting to from 0000 - 1111 (0 - 15)
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    #10 Cp = 1;
    #10 Cp = 0;
    
    // Simulate data output to W bus
    #10 Ep = 1;
    #10 Ep = 0;

    $stop;
  end

endmodule