module ALU(
	input wire [7:0] A,B,
	input wire [3:0] ControlSig,
	output wire zero,
	output wire [7:0] S
	);
	
	wire [7:0] int_LU,int_AU,int_SLT,int_AULU,int_S;
	
	LogicUnit LU_inst(
		.A(A),
		.B(B),
		.sel(ControlSig[0]),
		.O(int_LU));
		
	ArthmeticUnit AU_inst(
		.A(A),
		.B(B),
		.sel(ControlSig[2]),
		.O(int_AU));
	
	SetLessThanUnit SLT_inst(
		.A(A),
		.B(B),
		.O(int_SLT)
	);
	
	mux2to1Nbit muxAULU(
		.A(int_LU),
		.B(int_AU),
		.sel(ControlSig[1]),
		.O(int_AULU)
		);
	
	mux2to1Nbit muxFinal(
		.A(int_AULU),
		.B(int_SLT),
		.sel(ControlSig[2] & ControlSig[1] & ControlSig[0]),
		.O(int_S)
		);
	
	//Output Drivers
	
	assign S = int_S;
	assign zero =  ~(int_S[0] | int_S[1] | int_S[2] | int_S[3] | int_S[4] | int_S[5] | int_S[6] | int_S[7]);
endmodule	