module datapath (
  input             clk, reset,
  input             PCEn, IorD, MemWrite, IRWrite, RegDst, 
  input             MemtoReg, RegWrite, ALUSrcA,
  input       [1:0] PCSrc, ALUSrcB,
  input       [2:0] ALUCtrl,
  output wire [5:0] OPCode, Funct,
  output            Z
);

// contains all the architectural logic elements like the mux, memories alu that make up the processor
// receives the control signals from the control unit

wire [31:0] PC, Adr;
wire [31:0] IRData, Instr;
wire [31:0] Data;
wire [4:0]  wrReg;
wire [31:0] ALUOut, wrData, rdData1, rdData2;
wire [31:0] rd1_reg, rd2_reg;
wire [31:0] SignImm, SignImmShft;
wire [31:0] srcA, srcB, ALUResult;
wire [31:0] PCNext;

reset_en_ff pcFF (.clk(clk), .reset(reset), .en(PCEn), .d(PCNext), .q(PC));

// pcmux/ selects PC value or calc addr from alu
mux21 pcmux (.a(PC), .b(ALUOut), .sel(IorD), .y(Adr));

// instr/data memory
instrdataMem idmem (.clk(clk), .wrEn(MemWrite), .addr(Adr), .wrData(rd2_reg), .rdData(IRData));

// IR/Data reg
reset_en_ff instr_reg (.clk(clk), .reset(reset), .en(IRWrite), .d(IRData), .q(Instr));
assign OPCode = Instr[31:26];
assign Funct = Instr[5:0];

// data reg just after mem
reset_ff data_reg (.clk(clk), .reset(reset), .d(IRData), .q(Data));

// dst reg sel
mux21 #(.WIDTH(5)) regDstmux (.a(Instr[20:16]), .b(Instr[15:11]), .sel(RegDst), .y(wrReg));

// dst data sel
mux21 memtoRegmux (.a(ALUOut), .b(Data), .sel(MemtoReg), .y(wrData));

// reg file
reg_file rf (.clk(clk), .rdAddr1(Instr[25:21]), .rdAddr2(Instr[20:16]),
             .wrAddr(wrReg), .regWrite(RegWrite), .wrData(wrData),
             .rdData1(rdData1), .rdData2(rdData2));
             
// ref file read port 1 output reg
reset_ff rfd1_reg (.clk(clk), .reset(reset), .d(rdData1), .q(rd1_reg));

// ref file read port 2 output reg
reset_ff rfd2_reg (.clk(clk), .reset(reset), .d(rdData2), .q(rd2_reg));

// sign extend
signExt signext1 (.a(Instr[15:0]), .y(SignImm));

// brach shift left by 2
shftl2 sl1 (.a(SignImm), .y(SignImmShft));

// alu scrA mux
mux21 srcAmux (.a(PC), .b(rd1_reg), .sel(ALUSrcA), .y(srcA)); 

// alu srcB mux
mux41 srcBmux (.a(rd2_reg), .b(32'h4), .c(SignImm), .d(SignImmShft),
                            .sel(ALUSrcB), .y(srcB));

//alu
alu alu1 (.srcA(srcA), .srcB(srcB), .ALUCtrl(ALUCtrl), .ALUResult(ALUResult), .Z(Z));

// alu result reg
reset_ff aluRes_reg (.clk(clk), .reset(reset), .d(ALUResult), .q(ALUOut));

// result select mux
mux41 resmux (.a(ALUResult), .b(ALUOut), .c({PC[31:28], Instr[25:0], 2'b00}), .d(),.sel(PCSrc), .y(PCNext));

endmodule