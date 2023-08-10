`timescale 1ns/100ps

  module RAM_Test_Bench();
  reg CLK, nrd, nwr, nCe;
  reg [3:0] addr;
  reg [7:0] data;
  
  wire [7:0] data_out;

   RAM TB( .CLK(CLK), .nrd(nrd), .nwr(nwr), .nCe(nCe), .addr(addr), .data(data_out));

  // Clock generation
  always begin
    #5 CLK = ~CLK;
  end

  // Initial block for simulation setup
  initial begin
    CLK = 0;
    nrd = 1;
    nwr = 1;
    nCe = 1;
    addr = 4'b0000;
    data = 8'b00000000;

    // Simulate a read operation
    #10 nCe = 0;    // Enable RAM
    nrd = 0;        // Read operation
    addr = 4'b0010; // Example address
    #10 nCe = 1;    // Disable RAM
    nrd = 1;        // Stop read

    // Simulate a write operation
    #10 nCe = 0;        // Enable RAM
    nwr = 0;            // Write operation
    addr = 4'b0101;     // Example address
    data = 8'b11011100; // Example data
    #10 nCe = 1;        // Disable RAM
    nwr = 1;            // Stop write

    $stop; 
  end

endmodule
