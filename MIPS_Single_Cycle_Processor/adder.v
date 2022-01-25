module adder (
  input [31:0] a, b,
  output wire [31:0] y
);

// adds 2 32 bit numbers

assign y = a + b;

endmodule