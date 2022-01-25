module mainDecoder (
  input      [5:0] OPCode,
  output reg       MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump,
  output reg [1:0] ALUOp
);

// decodes the instruction to generate the correct control signals

always @(*)
  case (OPCode)
    6'b000000: // R-type
      {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b110000100;
	 
	  6'b100011: // lw
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b101001000;
	 
	  6'b101011: // sw
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b0x101x000;
	 
	  6'b000100: // beq
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b0x010x010;
	 
	  6'b001000: // addi
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b101000000;
	 
	  6'b000010: // j
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'b0xxx0xxx1;
	 
	 default: 
	   {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump} = 9'bxxxxxxxxx;
  endcase

endmodule