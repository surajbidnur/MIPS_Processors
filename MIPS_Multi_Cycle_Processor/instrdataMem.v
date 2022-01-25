module instrdataMem (
  input              clk, wrEn,
  input       [31:0] addr,
  input       [31:0] wrData,
  output wire [31:0] rdData
);

// unified intruction and data memory (32 bits wide, 64 bits deep)

reg [31:0] mem [63:0];

always @(posedge clk)
  if (wrEn)
    mem[addr[7:2]] = wrData;

assign rdData = mem[addr[7:2]];

initial $readmemh("memfile.dat", mem);

endmodule