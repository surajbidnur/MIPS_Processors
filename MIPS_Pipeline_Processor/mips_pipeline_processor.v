module mips_pipeline_processor (
  input clk, reset
);

wire [5:0] OPCode, Funct;
wire       MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegDst_ID, RegWrite_ID, Branch_ID;
wire [2:0] ALUControl_ID;

// hazard unit signals
wire [4:0] Rs_EX_HU, Rt_EX_HU, Rs_ID_HU, Rt_ID_HU, WriteReg_MEM_HU, WriteReg_WB_HU, WriteReg_EX_HU;
wire       RegWrite_MEM_HU, RegWrite_WB_HU, MemtoReg_EX_HU, RegWrite_EX_HU, MemtoReg_MEM_HU, Branch_ID_HU;
wire [1:0] fwdA_EX_HU, fwdB_EX_HU;
wire       Stall_IF_HU, Stall_ID_HU, Flush_EX_HU, SrcAfwd_ID, SrcBfwd_ID;

// datapath
datapath dp (.clk(clk), .reset(reset),
             .MemtoReg_ID(MemtoReg_ID), .MemWrite_ID(MemWrite_ID),
             .ALUSrc_ID(ALUSrc_ID), .RegDst_ID(RegDst_ID), .RegWrite_ID(RegWrite_ID),
             .Branch_ID(Branch_ID), .ALUControl_ID(ALUControl_ID), 
             .fwdA_EX_HU(fwdA_EX_HU), .fwdB_EX_HU(fwdB_EX_HU),
             .Stall_ID_HU(Stall_ID_HU), .Stall_IF_HU(Stall_IF_HU), .Flush_EX_HU(Flush_EX_HU),
             .SrcAfwd_ID(SrcAfwd_ID), .SrcBfwd_ID(SrcBfwd_ID),
             .Rs_EX_HU(Rs_EX_HU), .Rt_EX_HU(Rt_EX_HU), .Rs_ID_HU(Rs_ID_HU), .Rt_ID_HU(Rt_ID_HU),
             .WriteReg_MEM_HU(WriteReg_MEM_HU), .WriteReg_WB_HU(WriteReg_WB_HU),
             .WriteReg_EX_HU(WriteReg_EX_HU), .RegWrite_MEM_HU(RegWrite_MEM_HU),
             .RegWrite_WB_HU(RegWrite_WB_HU), .MemtoReg_EX_HU(MemtoReg_EX_HU),
             .Branch_ID_HU(Branch_ID_HU), .RegWrite_EX_HU(RegWrite_EX_HU),
             .MemtoReg_MEM_HU(MemtoReg_MEM_HU), .OPCode(OPCode), .Funct(Funct));

// control logic
controlUnit ctrlU (.OPCode(OPCode), .Funct(Funct),
                   .MemtoReg(MemtoReg_ID), .MemWrite(MemWrite_ID), .Branch(Branch_ID),
                   .ALUSrc(ALUSrc_ID), .RegDst(RegDst_ID), .RegWrite(RegWrite_ID),
                   .ALUControl(ALUControl_ID));

// Hazard Unit
hazard_unit hu1 (.Rs_EX_HU(Rs_EX_HU), .Rt_EX_HU(Rt_EX_HU), .Rs_ID_HU(Rs_ID_HU), .Rt_ID_HU(Rt_ID_HU),
                 .WriteReg_MEM_HU(WriteReg_MEM_HU), .WriteReg_WB_HU(WriteReg_WB_HU),
                 .WriteReg_EX_HU(WriteReg_EX_HU), .RegWrite_MEM_HU(RegWrite_MEM_HU),
                 .RegWrite_WB_HU(RegWrite_WB_HU), .MemtoReg_EX_HU(MemtoReg_EX_HU),
                 .RegWrite_EX_HU(RegWrite_EX_HU), .MemtoReg_MEM_HU(MemtoReg_MEM_HU),
                 .Branch_ID_HU(Branch_ID_HU), .fwdA_EX_HU(fwdA_EX_HU), .fwdB_EX_HU(fwdB_EX_HU),
                 .Stall_IF(Stall_IF_HU), .Stall_ID(Stall_ID_HU), .Flush_EX(Flush_EX_HU),
                 .SrcAfwd_ID(SrcAfwd_ID), .SrcBfwd_ID(SrcBfwd_ID));

endmodule