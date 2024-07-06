module mux8to1Nbit #(
	parameter int N = 8
	)(
	input wire [N-1:0] in1,in2,in3,in4,in5,in6,in7,in8,
	input wire [2:0] sel,
	output wire [N-1:0] Out
	);
	
	wire [N-1:0] int_in1,int_in2,int_in3,int_in4,int_in5,int_in6,int_in7,int_in8;
	
	and1toN #(N) and1_inst(
			.in(in1),
			.andBit(~(sel[2] | sel[1] | sel[0])),
			.out(int_in1)
		);
		
	and1toN #(N) and2_inst(
			.in(in2),
			.andBit(~(sel[2] | sel[1]) & sel[0]),
			.out(int_in2)
		);
	
	and1toN #(N) and3_inst(
			.in(in3),
			.andBit(~(sel[2] | sel[0]) & sel[1] ),
			.out(int_in3)
		);
	
	and1toN #(N) and4_inst(
			.in(in4),
			.andBit(~(sel[2]) & sel[0] & sel[1]),
			.out(int_in4)
		);
		
	and1toN #(N) and5_inst(
			.in(in5),
			.andBit(sel[2] & ~(sel[1] | sel[0])),
			.out(int_in5)
		);
	
	and1toN #(N) and6_inst(
			.in(in6),
			.andBit(sel[2] & sel[0] & ~(sel[1])),
			.out(int_in6)
		);
	
	and1toN #(N) and7_inst(
			.in(in7),
			.andBit(sel[2] & sel[1] & ~(sel[0])),
			.out(int_in7)
		);
	
	and1toN #(N) and8_inst(
			.in(in8),
			.andBit(sel[2] & sel[0] & sel[1]),
			.out(int_in8)
		);
	
	//Output Driver
	
	assign Out = int_in1 | int_in2 | int_in3 | int_in4 | int_in5 | int_in6 | int_in7 | int_in8;

endmodule