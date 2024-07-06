module ArthmeticUnit(
	input wire [7:0] A,B,
	input wire sel,
	output wire O
	);
	
	wire [7:0] int_B;
	
	complementerNbit #(8) compAU(
		.A(B),
		.B(sel),
		.O(int_B)
		);
	
	fullAdderNbit #(8) adderAU(
		.A(A),
		.B(int_B),
		.Cin(1'b0),
		.Cout(),
		.S(O)
		);
endmodule
	