module  controlUnit (
  input       [5:0] OPCode, Funct,
  output wire       MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite,
  output wire [2:0] ALUControl
);

wire [1:0] ALUOp;

mainDecoder maindec (.OPCode(OPCode), .MemtoReg(MemtoReg), .MemWrite(MemWrite),
                     .Branch(Branch), .ALUSrc(ALUSrc), .RegDst(RegDst),
                     .RegWrite(RegWrite), .ALUOp(ALUOp));

ALUDecoder aludec (.ALUOp(ALUOp), .Funct(Funct), .ALUControl(ALUControl));

endmodule