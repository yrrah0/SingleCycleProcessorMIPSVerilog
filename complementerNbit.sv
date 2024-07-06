module complementerNbit #(
	parameter int N = 8
	)(
	input wire [N-1:0] A,
	input wire B,
	output wire [N-1:0] O
	);
	
	wire [N-1:0] int_O;
	wire [N-1:0] int_B;
	
	assign int_B = {N{1'b0}};
	
	integer i;
	
	always @*begin
   for (i = 0; i < N; i++) begin
       int_O[i] = A[i] ^ B;
	end
	end
	 
	 fullAdderNbit #(N) adder_inst(
		.A(A),
		.B(int_B),
		.Cin(1'b0),
		.Cout(),
		.S(O));
	 
endmodule