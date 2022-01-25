module datapath (
  input clk, reset,
  input Jump, PCSrc, MemtoReg, MemWrite, ALUSrc, RegDst, RegWr,
  input [2:0] ALUCtrl,
  output wire [5:0] OPCode, Funct,
  output      Z
);

// contains all the architectural logic elements like the mux, memories alu that make up the processor
// receives the control signals from the control unit

wire [31:0] PC, PCNext, PCNextBr, PCPlus4, PCBranch;
wire [31:0] Instr;
wire [4:0] wrReg;
wire [31:0] Result, SrcA, wrDataOut, SignImm, SrcB, ALUResult, readData;
wire [31:0] SignImmShft;

//pc logic
pcLogic pcl (.clk(clk), .reset(reset), .PCIn(PCNext), .PCOut(PC));
adder pcPlus4 (.a(PC), .b(32'h4), .y(PCPlus4));

// instr mem
instrMem imem1 (.a(PC[7:2]), .instr(Instr));
assign OPCode = Instr[31:26];
assign Funct = Instr[5:0];

// jump datapath
mux21 jmux (.a(PCNextBr), .b({PCPlus4[31:28],Instr[25:0],2'b00}), .sel(Jump), .y(PCNext));
mux21 pcmux (.a(PCPlus4), .b(PCBranch), .sel(PCSrc), .y(PCNextBr));

// sign extend
signExt signext1 (.a(Instr[15:0]), .y(SignImm));

// reg file
reg_file rf (.clk(clk), .rdAddr1(Instr[25:21]), .rdAddr2(Instr[20:16]),
             .wrAddr(wrReg), .regWrite(RegWr), .wrData(Result),
             .rdData1(SrcA), .rdData2(wrDataOut));

// branch logic
shftl2 sl1 (.a(SignImm), .y(SignImmShft));
adder pcBranchadder (.a(SignImmShft), .b(PCPlus4), .y(PCBranch));
             
// dst reg sel
mux21 #(5) regDstmux (.a(Instr[20:16]), .b(Instr[15:11]), .sel(RegDst), .y(wrReg));

// alu srcB sel
mux21 aluSrcBmux (.a(wrDataOut), .b(SignImm), .sel(ALUSrc), .y(SrcB));

//alu
alu alu1 (.srcA(SrcA), .srcB(SrcB), .ALUCtrl(ALUCtrl), .ALUResult(ALUResult), .Z(Z));

//data mem
dataMem dmem1 (.clk(clk), .wrEn(MemWrite), .addr(ALUResult), .wrData(wrDataOut), .rdData(readData));

// result mux
mux21 resmux (.a(ALUResult), .b(readData), .sel(MemtoReg), .y(Result));

endmodule