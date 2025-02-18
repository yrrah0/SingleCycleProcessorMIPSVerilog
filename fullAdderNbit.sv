module fullAdderNbit#(
	parameter int N = 8
	)(
	input wire [N-1:0] A,
	input wire [N-1:0] B,
	input wire Cin,
	output wire Cout,
	output wire [N-1:0] S
	);
	
	genvar i;
	
	wire [N:0] int_C;
	
	assign int_C[0] = Cin;
	
	generate for(i = 0; i < N ; i++) begin : adderInst
		fullAdder1bit adder_inst(
			.A(A[i]),
			.B(B[i]),
			.Cin(int_C[i]),
			.Cout(int_C[i+1]),
			.S(S[i])
			);
		end
	endgenerate
	
	//Output Drivers
	assign Cout = int_C[N];
	
endmodule	
			