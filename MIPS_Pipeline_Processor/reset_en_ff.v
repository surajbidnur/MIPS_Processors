module reset_en_ff #(
  parameter WIDTH = 32)
(
  input             clk, reset, en, clr,
  input      [WIDTH-1:0] d,
  output reg [WIDTH-1:0] q
);

// enable is actualy stall signal, so if en=1, stall=0 so logic flows through pipeline
// wire enb = !en;

// always @(posedge clk or posedge reset)
//   if (reset)   q <= 32'b0;
//   else if (en) q <= d;

// ff with async global active low reset and enable and clr input
always @(posedge clk or negedge reset)
  if (!reset)    q <= {WIDTH{1'b0}};
  else if (clr)  q <= {WIDTH{1'b0}};
  else if (!en)  q <= d;

endmodule