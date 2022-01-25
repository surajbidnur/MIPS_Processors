module dataMem(
  input clk, wrEn,
  input [31:0] addr, wrData,
  output wire [31:0] rdData
);

reg [31:0] dmem [63:0];

assign rdData = dmem[addr[7:2]]; //word aligned

always @(posedge clk)
  if (wrEn)
    dmem[addr[7:2]] <= wrData; //word aligned

endmodule