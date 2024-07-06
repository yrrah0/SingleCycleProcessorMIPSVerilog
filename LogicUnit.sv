module LogicUnit(
	input wire [7:0] A,B,
	input wire sel,
	output wire [7:0] O
	);
	
	wire [7:0] int_and,int_or;
	
	andNtoN #(8) andUnit(
		.A(A),
		.B(B),
		.C(int_and)
		);
	
	orNtoN #(8) orUnit(
		.A(A),
		.B(B),
		.C(int_or)
		);
	
	mux2to1Nbit #(8) muxUnit(
		.A(int_and),
		.B(int_or),
		.sel(sel),
		.O(O)
		);
endmodule