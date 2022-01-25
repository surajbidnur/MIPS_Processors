module mux21 #(
  parameter WIDTH = 32)
(
  input       [WIDTH-1:0] a, b,
  input                   sel,
  output wire [WIDTH-1:0] y
);

// 2:1 mux

assign y = sel ? b : a;

endmodule