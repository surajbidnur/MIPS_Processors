module reset_en_ff (
  input             clk, reset, en,
  input      [31:0] d,
  output reg [31:0] q
);

// async active high async reset dff with enable input

always @(posedge clk or posedge reset)
  if (reset)   q <= 32'b0;
  else if (en)  q <= d;

endmodule