module ALUControl(
	input wire [1:0] ALUOp,
	input wire [5:0] funct,
	output wire [3:0] ALUControl
	);
	
	always_comb begin
        case (ALUOp)
            2'b00:  // Load/Store instructions
                ALUControl = 4'b0010;  // ADD operation
            
            2'b01:  // Branch instructions
                ALUControl = 4'b0110;  // SUB operation
            
            2'b10:  // R-type instructions
                case (funct)
                    6'b100000:  // ADD
                        ALUControl = 4'b0010;
                    6'b100010:  // SUB
                        ALUControl = 4'b0110;
                    6'b100100:  // AND
                        ALUControl = 4'b0000;
                    6'b100101:  // OR
                        ALUControl = 4'b0001;
                    6'b101010:  // SLT
                        ALUControl = 4'b0111;
                    default:  // Undefined operation
                        ALUControl = 4'b0000;
                endcase
            
            default:  // Undefined operation
                ALUControl = 4'b0000;
        endcase
    end
endmodule