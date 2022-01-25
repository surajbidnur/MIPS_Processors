module alu (
  input [31:0] srcA, srcB,
  input [2:0]  ALUCtrl,
  output reg [31:0] ALUResult,
  output wire        Z
);

always @(*)
  casex(ALUCtrl)
    3'b000: ALUResult = srcA & srcB;
    3'b001: ALUResult = srcA | srcB;
    3'b010: ALUResult = srcA + srcB;
    3'b110: ALUResult = srcA - srcB;
    3'b111: begin
      if (srcA[31] ^ srcB[31]) ALUResult = {31'b0,srcA[31]};           // MSB are opposing, then a<b only if a is -ve
      else begin
        if (srcA < srcB) ALUResult = 32'b1;  // ALUResult = (srcA - srcB)[31]; // is same sign, then subtract and check if a-b is -ve
        else             ALUResult = 32'b0;
      end
    end
    default: ALUResult = 32'bx;
  endcase

assign Z = (ALUResult != 32'b0) ? 1'b0 : 1'b1;

endmodule