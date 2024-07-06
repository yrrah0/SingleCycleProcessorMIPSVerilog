module combineData(
	input wire RegDst,Jump,MemRead,MemToReg,ALUSrc,
	input wire [1:0] ALUOp,
	output wire [7:0] O
	);
	
	assign O[7] = 1'b0;
	assign O[6] = RegDst;
	assign O[5] = Jump;
	assign O[4] = MemRead;
	assign O[3] = MemToReg;
	assign O[2] = ALUSrc;
	assign O[1:0] = ALUOp;

endmodule