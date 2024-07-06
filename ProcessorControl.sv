module ProcessorControl(
	input wire [5:0] opcode,
	output wire Branch,Jump,RegDst,ALUSrc,MemToReg,MemRead,MemWrite,RegWrite,
	output wire [1:0] ALUOp
	);
	
	wire dec35,dec43,dec0,dec4,dec2;
	
	 assign dec35 = opcode[5] & opcode[1] & opcode[0] & ~(opcode[4] | opcode[3] | opcode[2]);
    assign dec43 = opcode[5] & opcode[3] & opcode[1] & opcode[0] & ~(opcode[4] | opcode[2]);
    assign dec0 = ~(opcode[0] | opcode[1] | opcode[2] | opcode[3] | opcode[4] | opcode[5]);
    assign dec4 = ~(opcode[0] | opcode[1] | opcode[3] | opcode[4] | opcode[5]) & opcode[2];
    assign dec2 = ~(opcode[0] | opcode[2] | opcode[3] | opcode[4] | opcode[5]) & opcode[1];
    
    assign Branch = dec4;
    assign Jump = dec2;
    assign RegDst = dec0;
    assign ALUSrc = dec35 | dec43 | dec4 | dec2;
    assign MemToReg = dec35;
    assign MemRead = dec35;
    assign MemWrite = dec43;
    assign RegWrite = dec35 | dec0;
    assign ALUOp[0] = dec4;
    assign ALUOp[1] = dec0;

endmodule