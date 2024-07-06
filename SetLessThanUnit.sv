module SetLessThanUnit(
	input wire [7:0] A,B,
	output wire [7:0] O
);
	always_comb begin
        if (A < B) begin
            O = 8'b00000001;
        end else begin
            O = 8'b00000000;
        end
    end
endmodule