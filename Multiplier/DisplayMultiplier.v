module DisplayMultiplier(
	input  [3:0] a, b,
	output [6:0] dout0, dout1
);
	wire [3:0] prod0, prod1;
	Multiplier m(
		.a( a ),
		.b( b ),
		.prod({ prod1, prod0 })
	);
	SevenSegment ss0( .din(prod0), .dout(dout0) );
	SevenSegment ss1( .din(prod1), .dout(dout1) );
endmodule
