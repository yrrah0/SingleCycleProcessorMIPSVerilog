module and1toN#(
	parameter int N = 8
	)(
	input wire [N-1:0] in,
	input wire andBit,
	output wire [N-1:0] out
	);

	genvar i;
	
	generate for(i = 0; i < N; i++) begin : andInst
		and1to1 and_inst (
			.a(in[i]),
			.b(andBit),
			.o(out[i])
			);
		end
	endgenerate
endmodule
	
	
	