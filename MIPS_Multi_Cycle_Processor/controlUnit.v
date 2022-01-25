module  controlUnit (
  input             clk, reset,
  input       [5:0] OPCode, Funct,
  input             Zero,
  output wire       MemtoReg, RegDst, IorD, ALUSrcA,   // mux selects
  output wire [1:0] PCSrc, ALUSrcB,
  output wire       IRWrite, MemWrite, RegWrite, PCEn, // reg enables
  output wire [2:0] ALUControl
);

// main processor control unit. 
// generates all the necessary control signals based on the instruction being processed

wire       Branch, PCWrite, bz;
wire [1:0] ALUOp;

mainDecoder maindec (.clk(clk), .reset(reset), .OPCode(OPCode), .MemtoReg(MemtoReg),
                     .RegDst(RegDst), .IorD(IorD), .ALUSrcA(ALUSrcA),
                     .PCSrc(PCSrc), .ALUSrcB(ALUSrcB),
                     .IRWrite(IRWrite), .MemWrite(MemWrite), .PCWrite(PCWrite),
                     .Branch(Branch), .RegWrite(RegWrite), .ALUOp(ALUOp));

ALUDecoder aludec (.ALUOp(ALUOp), .Funct(Funct), .ALUControl(ALUControl));

assign bz = Branch & Zero;
assign PCEn = bz | PCWrite;

endmodule