`timescale 1ns/100ps

module Adder_Subtractor_Test_Bench();
  reg [7:0] a, b; //inputs in design module turn into regs [3:0] 
  reg cb;         
  
  wire [7:0] s;   //outputs in design module turn into wires [3:0]
  wire cout;      
  
  Adder_Subtractor TB(a, b, s, cout, cb); //Calling the variables from Adder_Subtractor
  
  initial begin 
    //Uses $monitor to print out variables whenever at least one of the variables changes
    $monitor ($time, "a = %d, b = %d, s = %d, cout = %d , cb = %d", a, b, s, cout, cb); //%b for binary
  end
  
  initial begin
    //Setting a & b equal to some number which changes after some time
    #0  
    a = 5; b = 2; cb = 0; //cb = 0 means addition (5+2 or 0101 + 0010)
    #20 
    a = 4; b = 3; cb = 1; //cb = 1 means subtraction (4-3 or 0100 - 0011)
    #20 
    a = 7; b = 6; cb = 1; //(7-6) or (0111 - 0110) 
    #20 
    a = 1; b = 0; cb = 0; //(1+0) or (0001 + 0000) 
    
    #20 
    a = 7; b = -5; cb = 0; //cb = 0 means addition (7+-5 or 0101 + 1011)
    #20 
    a = 4; b = -3; cb = 1; //cb = 1 means subtraction (4-(-3) or 0100 - 1101)
    #20 
    a = -1; b = -2; cb = 1; //(-1-(-2) or (1111 - 1110) 
    #20 
    a = -6; b = 0; cb = 0; //(-6+0) or (1010 + 0000)
    #20 
    a = -3; b = 3; cb = 0; //(-3+3) or (1101 + 0000)
    
    #20
    a = 14; b = 2; cb = 0; //cb = 0 means addition (14+2 or  0000 1110 + 0000 0010)
    #20 
    a = 64; b = 45; cb = 1; //cb = 1 means subtraction (64-45 or 0100 0000 - 0010 1101)
    #20 
    a = 100; b = 37; cb = 1; //(100-37) or (0110 0100 - 0010 0101) 
    #20 
    a = 86; b = 9; cb = 0; //(86+9) or (0101 0110 + 0000 1001) 
    
    #20 
    a = 70; b = -50; cb = 0; //cb = 0 means addition (70+-50 or 0100 0110 + 1100 1110)
    #20 
    a = 123; b = -2; cb = 1; //cb = 1 means subtraction (123-(-2) or 0111 1011 - 1111 1110)
    #20 
    a = -68; b = -42; cb = 1; //(-68-(-42)) or (1011 1100 - 1101 0110) 
    #20 
    a = -96; b = -5; cb = 0; //(-96+-5) or (1010 0000 + 1111 1011)
    #20
    $stop;                //End the test
  end
  
endmodule