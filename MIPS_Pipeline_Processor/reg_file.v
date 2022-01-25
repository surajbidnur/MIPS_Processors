module reg_file (
  input             clk,
  input      [4:0]  rdAddr1, rdAddr2, wrAddr,
  input             regWrite,
  input      [31:0] wrData,
  output reg [31:0] rdData1, rdData2
);

reg [31:0] mem [31:0];

always @(posedge clk)
  if (regWrite)
    mem[wrAddr] <= wrData;

always @(negedge clk) begin
  if (rdAddr1 != 5'b0) rdData1 <= mem[rdAddr1];
  else                 rdData1 <= 32'b0;
end

always @(negedge clk) begin
  if (rdAddr2 != 5'b0) rdData2 <= mem[rdAddr2];
  else                 rdData2 <= 32'b0;
end

// assign rdData1 = (rdAddr1 != 5'b0) ? mem[rdAddr1] : 32'b0;
// assign rdData2 = (rdAddr2 != 5'b0) ? mem[rdAddr2] : 32'b0;

endmodule
