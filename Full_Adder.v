module Full_Adder (a, b, cin, s, cout);
  input  a, b, cin; // Input operands x & y and Carry-in input 
  
  output s, cout;	 // Output s and Carry-out output 
	 
	assign s = ((a ^ b) ^ cin);     // Sum is XOR of a, b, and cin
  assign cout = ((a & b) | (b & cin) | (cin & a));  // Cout is AND of a and b, OR AND of cin and a, OR AND of cin and a 

endmodule