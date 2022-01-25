module  controlUnit (
  input   [5:0] OPCode, Funct,
  input         Zero,
  output wire       MemtoReg, MemWrite, ALUSrc, RegDst, RegWrite, Jump,
  output wire [2:0] ALUControl,
  output wire       PCSrc
);

// main processor control unit. 
// generates all the necessary control signals based on the instruction being processed

wire       Branch;
wire [1:0] ALUOp;

mainDecoder maindec (.OPCode(OPCode), .MemtoReg(MemtoReg), .MemWrite(MemWrite),
                     .Branch(Branch), .ALUSrc(ALUSrc), .RegDst(RegDst), .RegWrite(RegWrite),
							       .Jump(Jump), .ALUOp(ALUOp));

ALUDecoder aludec (.ALUOp(ALUOp), .Funct(Funct), .ALUControl(ALUControl));

assign PCSrc = Branch & Zero;

endmodule