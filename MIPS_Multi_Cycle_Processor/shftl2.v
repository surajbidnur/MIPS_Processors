module shftl2 (
  input       [31:0] a,
  output wire [31:0] y
);

// left shift 32 bit input by 2 bits

assign y = {a[29:0], 2'b00};

endmodule