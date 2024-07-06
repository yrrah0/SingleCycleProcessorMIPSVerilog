module enARdFF_1 (
	input wire d,
	input wire clk,
	input wire resetBar,
	input wire en,
	output reg q
);
	
	always @(posedge clk or posedge (~resetBar))
	
	begin
	
		if ((~resetBar))
			q <= 1'b0;
		else if (en)
			q <= d;
	end
	
endmodule