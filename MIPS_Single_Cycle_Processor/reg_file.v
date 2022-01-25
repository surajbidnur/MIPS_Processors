module reg_file (
  input              clk,
  input       [4:0]  rdAddr1, rdAddr2, wrAddr,
  input              regWrite,
  input       [31:0] wrData,
  output wire [31:0] rdData1, rdData2
);

// architectural reg file
// 3 port memory - 2 read ports and 1 write port

reg [31:0] mem [31:0];

always @(posedge clk)
  if (regWrite)
    mem[wrAddr] <= wrData;

assign rdData1 = (rdAddr1 != 5'b0) ? mem[rdAddr1] : 32'b0;
assign rdData2 = (rdAddr2 != 5'b0) ? mem[rdAddr2] : 32'b0;

endmodule
