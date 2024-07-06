module mux2to1Nbit #(
	parameter int N = 8
	)(
	input wire [N-1:0]A,
	input wire [N-1:0]B,
	input wire sel,
	output wire [N-1:0] O
	);
	
	genvar i;
	
	wire [N-1:0] int_A,int_B;
	
	and1toN #(N) and1_inst(
			.in(A),
			.andBit(~sel),
			.out(int_A)
		);
	
	and1toN #(N) and2_inst(
		.in(B),
		.andBit(sel),
		.out(int_B)
		);
	
	//Output Drivers
	
	assign O = int_A | int_B;
	
endmodule
			