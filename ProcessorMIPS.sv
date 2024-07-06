module ProcessorMIPS(
	input wire [2:0] ValueSelect,
	input wire GClock,GResetBar,
	output wire [7:0] MuxOut,
	output wire [31:0] InstructionOut,
	output wire BranchOut,ZeroOut,MemWriteOut,RegWriteOut
	);
	//Signals and Wires
	
	wire [31:0] instruction,PC,PC4Added,BranchAddress,JumpAddress,BranchOffset,BranchMux,newPC;
	wire [4:0] ReadReg1,ReadReg2,WriteReg;
	wire [3:0] ALUControlSig;
	wire [7:0] Read1Data,Read2Data,ALUResult,WriteData,MemData,ALUBin,FinalData,int_OutMux;
	wire [1:0] ALUOp;
	wire zero,RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite;
	
	//PC and Memory Units
	
	registerNbit PCReg(
		.d(newPC),
		.resetBar(GResetBar),
		.clk(GClock),
		.en(GResetBar),
		.q(PC)
		);
	
	ROM1Port ROMUnit(
		.address(PC),
		.clock(GClock),
		.q(instruction)
		);
	
	PCAdd4 Add4Unit(
		.A(PC),
		.O(PC4Added)
		);
	
	JumpShiftCombPC JumpUnit(
		.Jump(instruction[25:0]),
		.PC(PC4Added[31:28]),
		.O(JumpAddress)
		);
	
	//Register File
	
	mux2to1Nbit muxWriteReg(
		.A(instruction[20:16]),
		.B(instruction[15:11]),
		.sel(RegDst),
		.O(WriteReg)
		);
	
	registerFile RegUnit(
		.ReadReg1(instruction[23:21]),
		.ReadReg2(instruction[18:16]),
		.clk(GClock),
		.resetBar(GResetBar),
		.RegWrite(RegWrite),
		.WriteData(WriteData),
		.ReadData1(Read1Data),
		.ReadData2(Read2Data)
		);
	
	mux2to1Nbit muxALUB(
		.A(Read2Data),
		.B(instruction[7:0]),
		.sel(ALUSrc),
		.O(ALUBin)
		);
	
	//ALU
	
	ALU ALUUnit(
		.A(Read1Data),
		.B(ALUBin),
		.ControlSig(ALUControlSig),
		.zero(zero),
		.S(ALUResult)
		);
	
	ALUControl ALUCntrlUnit(
		.ALUOp(ALUOp),
		.funct(instruction[5:0]),
		.ALUControl(ALUControlSig)
		);
	
	//Processor Control
	
	ProcessorControl ProcCntrlUnit(
		.opcode(instruction[31:26]),
		.RegDst(RegDst),
		.Jump(Jump),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite),
		.ALUOp(ALUOp)
		);
	
	//Memory Units
	
	RAM1Port RAMUnit(
		.address(ALUResult),
		.clock(GClock),
		.data(Read2Data),
		.wren(MemWrite),
		.q(MemData)
		);
	
	mux2to1Nbit muxMem(
		.A(ALUResult),
		.B(MemData),
		.sel(MemToReg),
		.O(WriteData)
		);
	
	//Branch and Jump Units
	
	extend32LeftShift2 extendAddrUnit(
		.A(instruction[15:0]),
		.O(BranchOffset)
		);
	
	fullAdderNbit #(32) BranchCalc(
		.A(PC4Added),
		.B(BranchOffset),
		.Cin(0),
		.S(BranchAddress)
		);
	
	mux2to1Nbit #(32) BranchMulti(
		.A(PC4Added),
		.B(BranchAddress),
		.sel(Branch & zero),
		.O(BranchMux)
		);
	
	mux2to1Nbit #(32) JumpMux(
		.A(BranchMux),
		.B(JumpAddress),
		.sel(Jump),
		.O(newPC)
		);
	
	//Top Level
	
	combineData outMix(
		.RegDst(RegDst),
		.Jump(Jump),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.ALUSrc(ALUSrc),
		.ALUOp(ALUOp),
		.O(FinalData)
		);
	
	mux8to1Nbit OutputMux(
		.sel(ValueSelect),
		.in1(PC[7:0]),
		.in2(ALUResult),
		.in3(Read1Data),
		.in4(Read2Data),
		.in5(WriteData),
		.in6(FinalData),
		.in7(FinalData),
		.in8(FinalData),
		.Out(MuxOut)
		);
	//Output Drivers
	
	assign InstructionOut = instruction;
	assign BranchOut = Branch;
	assign ZeroOut = zero;
	assign MemWriteOut = MemWrite;
	assign RegWriteOut = RegWrite;

endmodule
	