module DisplayRippleCarryFA(
	input  [3:0] a, b,
	output [6:0] dout
);
	wire [3:0] sum;
	wire cout;
	RippleCarryFA rcfa( .a(a), .b(b), .sum(sum), .cout(cout) );
	SevenSegment ss( .din(sum), .dout(dout) );
endmodule
