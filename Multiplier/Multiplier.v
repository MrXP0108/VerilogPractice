module MultiplierUnit(
	input [3:0] a,
	input b,
	output [3:0] prod
);
	assign prod[0] = a[0]&b;
	assign prod[1] = a[1]&b;
	assign prod[2] = a[2]&b;
	assign prod[3] = a[3]&b;
endmodule

module Multiplier(
	input [3:0] a,
	input [3:0] b,
	output [7:0] prod
);
	wire [3:0] prod_mu0, prod_mu1, prod_mu2, prod_mu3;
	MultiplierUnit mu0(.a(a), .b(b[0]), .prod(prod_mu0));
	MultiplierUnit mu1(.a(a), .b(b[1]), .prod(prod_mu1));
	MultiplierUnit mu2(.a(a), .b(b[2]), .prod(prod_mu2));
	MultiplierUnit mu3(.a(a), .b(b[3]), .prod(prod_mu3));
	
	wire [3:0] sum0, sum1, sum2;
	wire cout0, cout1, cout2;
	RippleCarryFA rcfa0(
		.a({ 1'b0, prod_mu0[3:1] }),
		.b( prod_mu1 ),
		.sum( sum0 ),
		.cout( cout0 )
	);
	RippleCarryFA rcfa1(
		.a({ cout0, sum0[3:1] }),
		.b( prod_mu2 ),
		.sum( sum1 ),
		.cout( cout1 )
	);
	RippleCarryFA rcfa2(
		.a({ cout1, sum1[3:1] }),
		.b( prod_mu3 ),
		.sum( sum2 ),
		.cout( cout2 )
	);
	
	assign prod[0] = prod_mu0[0];
	assign prod[1] = sum0[0];
	assign prod[2] = sum1[0];
	assign prod[6:3] = sum2;
	assign prod[7] = cout2;
endmodule
