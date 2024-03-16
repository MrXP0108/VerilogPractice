module FullAdder(
	input a, b, cin,
	output sum, cout
);
	assign sum = a^b^cin;
	assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

module RippleCarryFA( // 4-bit version
	input  [3:0] a, b,
	output [3:0] sum,
	output cout
);
	wire w0, w1, w2;
	FullAdder u0( .a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(w0)   );
	FullAdder u1( .a(a[1]), .b(b[1]), .cin(w0),   .sum(sum[1]), .cout(w1)   );
	FullAdder u2( .a(a[2]), .b(b[2]), .cin(w1),   .sum(sum[2]), .cout(w2)   );
	FullAdder u3( .a(a[3]), .b(b[3]), .cin(w2),   .sum(sum[3]), .cout(cout) );
endmodule
