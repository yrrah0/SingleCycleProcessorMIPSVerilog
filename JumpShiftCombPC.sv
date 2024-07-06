module JumpShiftCombPC(
	input wire[25:0] Jump,
	input wire [3:0] PC,
	output wire [31:0] O
	);
	
	assign O[1:0] = 2'b00;
	assign O[27:2] = Jump;
	assign O[31:28] = PC;

endmodule