module extend32LeftShift2(
	input wire [15:0] A,
	output wire [31:0] O);
	
	assign O[1:0] = 2'b00;
	assign O[15:2] = A[15:2];
	assign O[31:16] = {16{ A[15] }};
	
endmodule