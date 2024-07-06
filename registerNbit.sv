module registerNbit #(
	parameter int N = 8
	)(
	input wire [N-1:0] d,
	input wire resetBar,
	input wire clk,
	input wire en,
	output wire[N-1:0] q
	);

	genvar i;
	
	generate for(i = 0;i < N;i++)begin :inst_reg
		enARdFF_1 reg_inst (
			.d(d[i]),
			.resetBar(resetBar),
			.clk(clk),
			.en(en),
			.q(q[i])
		);
		end
	endgenerate
		
endmodule