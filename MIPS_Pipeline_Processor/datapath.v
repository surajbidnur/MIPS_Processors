module datapath (
  input             clk, reset,
  input             MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegDst_ID, RegWrite_ID, Branch_ID,
  input       [2:0] ALUControl_ID,
  input       [1:0] fwdA_EX_HU, fwdB_EX_HU,
  input             Stall_ID_HU, Stall_IF_HU, Flush_EX_HU, SrcAfwd_ID, SrcBfwd_ID,
  output wire [4:0] Rs_EX_HU, Rt_EX_HU, Rs_ID_HU, Rt_ID_HU, WriteReg_MEM_HU, WriteReg_WB_HU, WriteReg_EX_HU, 
  output wire       RegWrite_MEM_HU, RegWrite_WB_HU, MemtoReg_EX_HU, Branch_ID_HU, RegWrite_EX_HU, MemtoReg_MEM_HU,
  output wire [5:0] OPCode, Funct
);

//********************** WIRE DECLARATIONS **********************//

// IF stage signals
wire [31:0] PC_IF, PCNext_IF, PCPlus4_IF, Instr_IF;

// Decode stage signals
wire [31:0] Instr_ID, PCPlus4_ID, PCBranch_ID, SignImm_ID, SignImmShft, rdData1, rdData2, SrcA_ID, wrDataOut_ID;
wire        PCSrc_ID, Equal_ID;

// Execute stage signals
wire        RegWrite_EX, MemtoReg_EX, MemWrite_EX, ALUSrc_EX, RegDst_EX;
wire [2:0]  ALUControl_EX;
wire [31:0] SrcA_EX, SrcB_EX, ALUResult_EX, wrDataOut_EX, SignImm_EX;
wire [4:0]  Rs_EX, Rt_EX, Rd_EX, WriteReg_EX;
wire [31:0] SrcAfwd_EX, SrcBfwd_EX;

// Memory stage signals
wire        RegWrite_MEM, MemtoReg_MEM, MemWrite_MEM;
wire [31:0] ALUResult_MEM, wrDataOut_MEM, readData_MEM;
wire [4:0]  WriteReg_MEM;

// Writeback stage signals
wire        RegWrite_WB, MemtoReg_WB;
wire [31:0] ALUResult_WB, readData_WB, Result_WB;
wire [4:0]  WriteReg_WB;


//********************** Datapath Instances **********************//

// Instruction Fetch Stage
//pc select mux
mux21 pcmux (.a(PCPlus4_IF), .b(PCBranch_ID), .sel(PCSrc_ID), .y(PCNext_IF));

// WB_IF pipeline reg
reset_en_ff pcl (.clk(clk), .reset(reset), .en(Stall_IF_HU), .clr(1'b0), .d(PCNext_IF), .q(PC_IF));

// pc increment adder
adder pcPlus4 (.a(PC_IF), .b(32'h4), .y(PCPlus4_IF));

// instr mem
instrMem imem1 (.a(PC_IF[7:2]), .instr(Instr_IF));


// IF_ID pipeline reg
reset_en_ff im_reg      (.clk(clk), .reset(reset), .en(Stall_ID_HU), .clr(PCSrc_ID), .d(Instr_IF),   .q(Instr_ID));
reset_en_ff pcplus4_reg (.clk(clk), .reset(reset), .en(Stall_ID_HU), .clr(PCSrc_ID), .d(PCPlus4_IF), .q(PCPlus4_ID));


// Instruction Decode stage
assign OPCode = Instr_ID[31:26];
assign Funct = Instr_ID[5:0];

// reg file
reg_file rf (.clk(clk), .rdAddr1(Instr_ID[25:21]), .rdAddr2(Instr_ID[20:16]),
             .wrAddr(WriteReg_WB), .regWrite(RegWrite_WB), .wrData(Result_WB),
             .rdData1(rdData1), .rdData2(rdData2));

// rf read data mux to solve beq data dependencies
mux21 rd1mux (.a(rdData1), .b(ALUResult_MEM), .sel(SrcAfwd_ID), .y(SrcA_ID));
mux21 rd2mux (.a(rdData2), .b(ALUResult_MEM), .sel(SrcBfwd_ID), .y(wrDataOut_ID));

// equality checher for beq instr
assign Equal_ID = (SrcA_ID == wrDataOut_ID) ? 1'b1 : 1'b0;
assign PCSrc_ID = Branch_ID & Equal_ID;

// sign extend
signExt signext1 (.a(Instr_ID[15:0]), .y(SignImm_ID));

// branch logic
shftl2 sl1 (.a(SignImm_ID), .y(SignImmShft));
adder pcBranchadder (.a(SignImmShft), .b(PCPlus4_ID), .y(PCBranch_ID));

// hazard unit signals
assign Rs_ID_HU = Instr_ID[25:21];
assign Rt_ID_HU = Instr_ID[20:16];
assign Branch_ID_HU = Branch_ID;


// ID_EX pipeline reg
// control signals
reset_en_ff #(.WIDTH(1)) regwr_reg_idex    (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(RegWrite_ID),   .q(RegWrite_EX));
reset_en_ff #(.WIDTH(1)) memtoreg_reg_idex (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(MemtoReg_ID),   .q(MemtoReg_EX));
reset_en_ff #(.WIDTH(1)) memwr_reg_idex    (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(MemWrite_ID),   .q(MemWrite_EX));
reset_en_ff #(.WIDTH(3)) aluctrl_reg_idex  (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(ALUControl_ID), .q(ALUControl_EX));
reset_en_ff #(.WIDTH(1)) alusrc_reg_idex   (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(ALUSrc_ID),     .q(ALUSrc_EX));
reset_en_ff #(.WIDTH(1)) regdst_reg_idex   (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(RegDst_ID),     .q(RegDst_EX));

// data signals
reset_en_ff              srca_reg_idex (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(SrcA_ID),         .q(SrcA_EX));
reset_en_ff              wrdo_reg_idex (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(wrDataOut_ID),    .q(wrDataOut_EX));
reset_en_ff #(.WIDTH(5)) rs_reg_idex   (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(Instr_ID[25:21]), .q(Rs_EX));
reset_en_ff #(.WIDTH(5)) rt_reg_idex   (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(Instr_ID[20:16]), .q(Rt_EX));
reset_en_ff #(.WIDTH(5)) rd_reg_idex   (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(Instr_ID[15:11]), .q(Rd_EX));
reset_en_ff              simm_reg_idex (.clk(clk), .reset(reset), .en(1'b0), .clr(Flush_EX_HU), .d(SignImm_ID),      .q(SignImm_EX));


// Execute stage
// hazard unit signals
assign Rs_EX_HU = Rs_EX;
assign Rt_EX_HU = Rt_EX;
assign MemtoReg_EX_HU = MemtoReg_EX;
assign WriteReg_EX_HU = WriteReg_EX;
assign RegWrite_EX_HU = RegWrite_EX;

// forwarding mux src A
mux41 srcAfmux (.a(SrcA_EX), .b(Result_WB), .c(ALUResult_MEM), .d(),
                .sel(fwdA_EX_HU), .y(SrcAfwd_EX));

// forwarding mux src B
mux41 srcBfmux (.a(wrDataOut_EX), .b(Result_WB), .c(ALUResult_MEM), .d(),
                .sel(fwdB_EX_HU), .y(SrcBfwd_EX));

// alu srcB sel
mux21 aluSrcBmux (.a(SrcBfwd_EX), .b(SignImm_EX), .sel(ALUSrc_EX), .y(SrcB_EX));

//alu
alu alu1 (.srcA(SrcAfwd_EX), .srcB(SrcB_EX), .ALUCtrl(ALUControl_EX), .ALUResult(ALUResult_EX), .Z());

//  Dest reg mux
mux21 #(.WIDTH(5)) rdrtmux (.a(Rt_EX), .b(Rd_EX), .sel(RegDst_EX), .y(WriteReg_EX));


// EX_MEM pipeline reg
// control signals
reset_en_ff #(.WIDTH(1)) regwr_reg_exmem    (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(RegWrite_EX), .q(RegWrite_MEM));
reset_en_ff #(.WIDTH(1)) memtoreg_reg_exmem (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(MemtoReg_EX), .q(MemtoReg_MEM));
reset_en_ff #(.WIDTH(1)) memwr_reg_exmem    (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(MemWrite_EX), .q(MemWrite_MEM));

// data signals
reset_en_ff              alures_reg_exmem (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(ALUResult_EX), .q(ALUResult_MEM));
reset_en_ff              wrdo_reg_exmem   (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(SrcBfwd_EX),   .q(wrDataOut_MEM));
reset_en_ff #(.WIDTH(5)) wr_reg_exmem     (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(WriteReg_EX),  .q(WriteReg_MEM));


// Memory stage
// hazard unit signals
assign WriteReg_MEM_HU = WriteReg_MEM;
assign RegWrite_MEM_HU = RegWrite_MEM;
assign MemtoReg_MEM_HU = MemtoReg_MEM;

//data mem
dataMem dmem1 (.clk(clk), .wrEn(MemWrite_MEM), .addr(ALUResult_MEM), .wrData(wrDataOut_MEM), .rdData(readData_MEM));
// assign PCSrc_MEM = Branch_MEM & Z_MEM;


// MEM_WB pipeline reg
// control signals
reset_en_ff #(.WIDTH(1)) regwr_reg_memwb    (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(RegWrite_MEM), .q(RegWrite_WB));
reset_en_ff #(.WIDTH(1)) memtoreg_reg_memwb (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(MemtoReg_MEM), .q(MemtoReg_WB));

// data signals
reset_en_ff              alures_reg_memwb (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(ALUResult_MEM), .q(ALUResult_WB));
reset_en_ff              rd_reg_memwb     (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(readData_MEM),  .q(readData_WB));
reset_en_ff #(.WIDTH(5)) wr_reg_memwb     (.clk(clk), .reset(reset), .en(1'b0), .clr(1'b0), .d(WriteReg_MEM),  .q(WriteReg_WB));


// Writeback stage
// hazard unit signals
assign WriteReg_WB_HU = WriteReg_WB;
assign RegWrite_WB_HU = RegWrite_WB;

// result mux
mux21 resmux (.a(ALUResult_WB), .b(readData_WB), .sel(MemtoReg_WB), .y(Result_WB));

endmodule