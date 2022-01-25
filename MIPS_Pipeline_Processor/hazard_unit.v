module hazard_unit (
  input      [4:0] Rs_EX_HU, Rt_EX_HU, Rs_ID_HU, Rt_ID_HU, WriteReg_MEM_HU, WriteReg_WB_HU, WriteReg_EX_HU,
  input            RegWrite_MEM_HU, RegWrite_WB_HU, MemtoReg_EX_HU, RegWrite_EX_HU, MemtoReg_MEM_HU, Branch_ID_HU,
  output reg [1:0] fwdA_EX_HU, fwdB_EX_HU,
  output wire      Stall_IF, Stall_ID, Flush_EX, SrcAfwd_ID, SrcBfwd_ID
);

// declarations
wire lwStall, brStall, Stall, temp1, temp2;

// alu src a forwarding mux
always @(*) begin
  if ((Rs_EX_HU != 5'b0) && (Rs_EX_HU == WriteReg_MEM_HU) && RegWrite_MEM_HU)
    fwdA_EX_HU = 2'b10;
  else if ((Rs_EX_HU != 5'b0) && (Rs_EX_HU == WriteReg_WB_HU) && RegWrite_WB_HU)
    fwdA_EX_HU = 2'b01;
  else
    fwdA_EX_HU = 2'b00;
end

// alu src b forwarding mux
always @(*) begin
  if ((Rt_EX_HU != 5'b0) && (Rt_EX_HU == WriteReg_MEM_HU) && RegWrite_MEM_HU)
    fwdB_EX_HU = 2'b10;
  else if ((Rt_EX_HU != 5'b0) && (Rt_EX_HU == WriteReg_WB_HU) && RegWrite_WB_HU)
    fwdB_EX_HU = 2'b01;
  else
    fwdB_EX_HU = 2'b00;
end

// lw stall
// check isntr in ex and decode stage. stall IF and ID stage, flush EX stage
assign lwStall = ((Rs_ID_HU == Rt_EX_HU) || (Rt_ID_HU == Rt_EX_HU)) && MemtoReg_EX_HU;

// beq control hazard
assign SrcAfwd_ID = (Rs_ID_HU != 5'b0) && (Rs_ID_HU == WriteReg_MEM_HU) && RegWrite_MEM_HU;
assign SrcBfwd_ID = (Rt_ID_HU != 5'b0) && (Rt_ID_HU == WriteReg_MEM_HU) && RegWrite_MEM_HU;

assign temp1 = Branch_ID_HU && RegWrite_EX_HU && ((WriteReg_EX_HU == Rs_ID_HU) || (WriteReg_EX_HU == Rt_ID_HU));
assign temp2 = Branch_ID_HU && MemtoReg_MEM_HU && ((WriteReg_MEM_HU == Rs_ID_HU) || (WriteReg_MEM_HU == Rt_ID_HU));
assign brStall = temp1 || temp2;

assign Stall = lwStall || brStall;
assign {Stall_IF, Stall_ID, Flush_EX} = {3{Stall}};

endmodule