module mips_multi_cycle (
  input clk, reset
);

// top level module wrapping datapath and control unit

wire PCEn, IorD, MemWrite, IRWrite, RegDst;
wire MemtoReg, RegWrite, ALUSrcA;
wire [1:0] PCSrc, ALUSrcB;
wire [2:0] ALUCtrl;
wire [5:0] OPCode, Funct;
wire Zero;

// datapath
datapath dp (.clk(clk), .reset(reset),
             .PCEn(PCEn), .IorD(IorD), .MemWrite(MemWrite),
             .IRWrite(IRWrite), .RegDst(RegDst),
             .MemtoReg(MemtoReg), .RegWrite(RegWrite), .ALUSrcA(ALUSrcA),
             .PCSrc(PCSrc), .ALUSrcB(ALUSrcB), 
             .ALUCtrl(ALUCtrl), .OPCode(OPCode), .Funct(Funct), .Z(Zero));

// control logic
controlUnit ctrlU (.clk(clk), .reset(reset),
                   .OPCode(OPCode), .Funct(Funct), .Zero(Zero),
                   .MemtoReg(MemtoReg), .RegDst(RegDst), .IorD(IorD), .ALUSrcA(ALUSrcA),
                   .PCSrc(PCSrc), .ALUSrcB(ALUSrcB),
                   .IRWrite(IRWrite), .MemWrite(MemWrite), .RegWrite(RegWrite), .PCEn(PCEn),
                   .ALUControl(ALUCtrl));

endmodule