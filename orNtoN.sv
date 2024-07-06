module orNtoN #(
	parameter int N = 8
)(
	input wire [N-1:0] A,B,
	output wire [N-1:0] C
	);

	integer i;
	
	always @* begin
	for(i = 0;i < N;i++) begin
		C[i] = A[i] | B[i];
	end
	end
	
endmodule