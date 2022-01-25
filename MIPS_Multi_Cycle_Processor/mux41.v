module mux41 #(
  parameter WIDTH = 32)
(
  input       [WIDTH-1:0] a, b, c, d,
  input       [1:0]       sel,
  output reg  [WIDTH-1:0] y
);

// 4:1 mux

always @(*)
  case(sel)
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
    2'b11: y = d;
    default: ;
  endcase

endmodule