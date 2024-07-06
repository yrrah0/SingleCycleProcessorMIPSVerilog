module fullAdder1bit(
	input wire A,
	input wire B,
	input wire Cin,
	output wire Cout,
	output wire S
	);
	
	//Output Drivers
	assign Cout = (((A^B) & Cin) | (A & B));
	assign S = (A^B)^Cin;

endmodule