module decode5to32(
	input wire [4:0] in,
	output wire [31:0] out
	);
	
	decoder3to8 decode1(
		.en(~(in[4] | in[3])),
		.in(in[2:0]),
		.out(out[7:0])
		);
	
	decoder3to8 decode2(
		.en(~(in[4]) & in[3]),
		.in(in[2:0]),
		.out(out[15:8])
		);
	
	decoder3to8 decode3(
		.en(in[4] & ~(in[3])),
		.in(in[2:0]),
		.out(out[23:16])
		);
	
	decoder3to8 decode4(
		.en(in[4] & in[3]),
		.in(in[2:0]),
		.out(out[31:24])
		);
		
endmodule