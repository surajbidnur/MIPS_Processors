module reset_ff (
  input             clk, reset,
  input      [31:0] d,
  output reg [31:0] q
);

// async active high reset dff

always @(posedge clk or posedge reset)
  if (reset) q <= 32'b0;
  else        q <= d;

endmodule
