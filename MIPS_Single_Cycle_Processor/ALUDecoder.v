module ALUDecoder (
  input   [1:0] ALUOp,
  input   [5:0] Funct,
  output reg [2:0] ALUControl
);

// decodes the alu op and funct inputs to appropriate alu control signal

always @(*)
  casex ({ALUOp,Funct})
    8'b00_xxxxxx: ALUControl = 3'b010; // add
    8'bx1_xxxxxx: ALUControl = 3'b110; // subtract
	  8'b1x_100000: ALUControl = 3'b010; // add
	  8'b1x_100010: ALUControl = 3'b110; // subtract
	  8'b1x_100100: ALUControl = 3'b000; // and
	  8'b1x_100101: ALUControl = 3'b001; // or
	  8'b1x_101010: ALUControl = 3'b111; // set less than
	  default: ALUControl = 3'bxxx;
  endcase

endmodule