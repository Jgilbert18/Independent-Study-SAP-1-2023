`timescale 1ns/100ps

module Accumulator_A_Test_Bench();
  
  reg CLK, nLa, Ea;
  reg [7:0] ain;
  
  wire [7:0] aout, atemp;

  Accumulator_A TB( .CLK(CLK), .nLa(nLa), .Ea(Ea), .aout(aout), .ain(ain), .atemp(atemp));

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

  // Initial block for simulation setup
  initial begin
    CLK = 0;
    nLa = 1; // Set nLa high for now
    Ea = 1;  // Set Ea high for now
    ain = 8'b00000000;

    // Simulate data input from W bus
    #10 nLa = 0;       // Enable data reception
    ain = 8'b10101010; // Example input data
    #10 nLa = 1;       // Disable data reception

    // Simulate data output to W bus
    #10 Ea = 0; // Enable data output
    #10 Ea = 1; // Disable data output

    $stop; 
  end

endmodule
