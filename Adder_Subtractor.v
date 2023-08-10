module Adder_Subtractor (a, b, s, cout, cb);
	input [7:0] a ,b;
	input cb;
	
	output [7:0] s;
	output cout;
	
	assign s = a ^ b ^ cb;
	assign co = (a&b) | (a&cb) | (b&cb);
	
endmodule