module and1to1(
	input wire a,
	input wire b,
	output wire o
	);
	
	//Output Drivers
	assign o = a & b;
	
endmodule