module mainDecoder (
  input      [5:0] OPCode,
  output reg       MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite,
  output reg [1:0] ALUOp
);

always @(*)
  case (OPCode)
    6'b000000: // R-type
      {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b1_1_0_0_0_0_10;
	 
	  6'b100011: // lw
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b1_0_1_0_0_1_00;
	 
	  6'b101011: // sw
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b0_x_1_0_1_x_00;
	 
	  6'b000100: // beq
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b0_x_0_1_0_x_01;
	 
	  6'b001000: // addi
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b1_0_1_0_0_0_00;
	 
	  6'b000010: // j
	    {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'b0_x_x_x_0_x_xx;
	 
	 default: 
	   {RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp} = 8'bx_x_x_x_x_x_xx;
  endcase

endmodule