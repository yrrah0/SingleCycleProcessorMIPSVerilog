module registerFile(
	input wire [2:0] ReadReg1,ReadReg2, WriteReg,
	input wire clk,
	input wire resetBar,
	input wire RegWrite,
	input wire [7:0] WriteData,
	output wire [7:0] ReadData1,ReadData2
	);
	
	genvar i;
	
	wire[7:0] int_writeReg;
	wire[7:0] int_reg [7:0];
	
	decoder3to8 decodeWrite(
		.en(RegWrite),
		.in(WriteReg),
		.out(int_writeReg)
		);
	
	generate for(i = 0 ; i < 8 ; i++) begin : regFile
	registerNbit #(8) reg_inst(
		.d(WriteData),
		.clk(clk),
		.resetBar(resetBar),
		.en(RegWrite & int_writeReg[i]),
		.q(int_reg[i])
		);
		end
	endgenerate
	
	mux8to1Nbit #(8) readData1Mux(
		.in1(int_reg[0]),
		.in2(int_reg[1]),
		.in3(int_reg[2]),
		.in4(int_reg[3]),
		.in5(int_reg[4]),
		.in6(int_reg[5]),
		.in7(int_reg[6]),
		.in8(int_reg[7]),
		.sel(ReadReg1),
		.Out(ReadData1)
		);
	
	mux8to1Nbit #(8) readData2Mux(
		.in1(int_reg[0]),
		.in2(int_reg[1]),
		.in3(int_reg[2]),
		.in4(int_reg[3]),
		.in5(int_reg[4]),
		.in6(int_reg[5]),
		.in7(int_reg[6]),
		.in8(int_reg[7]),
		.sel(ReadReg2),
		.Out(ReadData2)
		);
		
endmodule
		