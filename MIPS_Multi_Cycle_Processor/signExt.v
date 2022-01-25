module signExt (
  input       [15:0] a,
  output wire [31:0] y
);

// sign extend 16 bit input to 32 bits

assign y = {{16{a[15]}},a};

endmodule