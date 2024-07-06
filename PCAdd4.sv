module PCAdd4(
	input wire [31:0] A,
	output wire [31:0] O
	);
	
	wire [32:0] int_C;
	wire [31:0] int_B;
	
	assign int_C[0] = 0;
	assign int_B[2] = 1;
	
	
	fullAdderNbit #(32) adder_inst(
		.A(A),
		.B(int_B),
		.Cin(0),
		.Cout(int_C[32]),
		.S(O)
		);
		
endmodule