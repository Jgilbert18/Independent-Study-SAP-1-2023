module Adder_Subtractor (a, b, s, cout, cb);
	input [7:0] a ,b;  // 8 bits for the operand a and b
	input cb;	   // The control bit
	
	output [7:0] s;   // 8 bits for the result of the a & b operation
	output cout;      // Carry-out bit
	
	assign s = a ^ b ^ cb;      // Calculates bitwise XOR operation bewteen a, b, and control bit without considering carry
	assign co = (a&b) | (a&cb) | (b&cb);  // calculates the carry using bitwise AND and OR operations between operand a, operand b, and the control bit 
	
endmodule
