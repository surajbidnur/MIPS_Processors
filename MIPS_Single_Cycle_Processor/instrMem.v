module instrMem (
  input [5:0] a,
  output wire [31:0] instr
);

// instruction memory reads from memfile.dat
// 32 wide and 64 deep

reg [31:0] imem [63:0];

assign instr = imem[a];

initial $readmemh("memfile.dat", imem);

endmodule