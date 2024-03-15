module FullAdder(
	input _a,
	input _b,
	input _cin,
	output _sum,
	output _cout
);
	assign _sum = _a^_b^_cin;
	assign _cout = (_a&_b)|(_b&_cin)|(_cin&_a);
endmodule

module RippleCarryFA( // 4-bit version
	input [3:0] a,
	input [3:0] b,
	output [3:0] sum,
	output cout
);
	wire w0, w1, w2;
	FullAdder u0(._a(a[0]), ._b(b[0]), ._cin(1'b0), ._sum(sum[0]), ._cout(w0));
	FullAdder u1(._a(a[1]), ._b(b[1]), ._cin(w0),   ._sum(sum[1]), ._cout(w1));
	FullAdder u2(._a(a[2]), ._b(b[2]), ._cin(w1),   ._sum(sum[2]), ._cout(w2));
	FullAdder u3(._a(a[3]), ._b(b[3]), ._cin(w2),   ._sum(sum[3]), ._cout(cout));
endmodule
