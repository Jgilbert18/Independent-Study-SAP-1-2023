`timescale 1ns/100ps

module InputMAR_Test_Bench();

  reg CLK, nLm, prog;
  reg [3:0] in;
  
  wire nrd, nwr;
  wire [3:0] addr;

  InputMAR input_mar (.CLK(CLK), .nLm(nLm), .prog(prog), .in(in), .nrd(nrd), .nwr(nwr), .addr(addr));

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

  // Initial block for simulation setup
  initial begin
    CLK = 0;
    nLm = 1;
    prog = 1;
    in = 4'b0000;

    // Simulate in run mode
    #10 prog = 1;     // Set to run mode

    // Test Scenario 1: Load address 2 in run mode
    #10 in = 4'b0010; // Example input
    nLm = 0;          // Enable address update
    #10 nLm = 1;      // Disable address update

    // Test Scenario 2: Address update in run mode
    #10 in = 4'b0101; // Example input
    nLm = 0;  	       // Enable address update
    #10 nLm = 1;      // Disable address update

    // Simulate in programming mode
    #10 prog = 0; // Set to programming mode

    // Test Scenario 3: Load address 12 in programming mode
    #10 in = 4'b1100; // Example input
    nLm = 0;          // Enable address update
    #10 nLm = 1;      // Disable address update

    // Test Scenario 4: Address update in programming mode
    #10 in = 4'b1011; // Example input
    nLm = 0;          // Enable address update
    #10 nLm = 1;      // Disable address update
    
    $stop; // Finish the simulation
  end

endmodule
