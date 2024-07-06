module mux2to1(
	input wire a,
	input wire b,
	input wire sel,
	output wire o
	);
	assign o = (~sel & a) | (sel & b);
	
endmodule
	
	