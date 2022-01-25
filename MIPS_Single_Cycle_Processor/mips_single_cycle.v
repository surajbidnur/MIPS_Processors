module mips_single_cycle (
  input clk, reset
);

// top level module that connects datapath and control unit together

wire [5:0] OPCode, Funct;
wire Zero;
wire Jump, PCSrc, MemtoReg, MemWrite, ALUSrc, RegDst, RegWr;
wire [2:0] ALUCtrl;

// datapath
datapath dp (.clk(clk), .reset(reset), .Jump(Jump),
             .PCSrc(PCSrc), .MemtoReg(MemtoReg), .MemWrite(MemWrite),
             .ALUSrc(ALUSrc), .RegDst(RegDst), .RegWr(RegWr),
             .ALUCtrl(ALUCtrl), .OPCode(OPCode), .Funct(Funct), .Z(Zero));

// control logic
controlUnit ctrlU (.OPCode(OPCode), .Funct(Funct), .Zero(Zero),
                   .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc),
                   .RegDst(RegDst), .RegWrite(RegWr), .Jump(Jump),
                   .ALUControl(ALUCtrl), .PCSrc(PCSrc));

endmodule