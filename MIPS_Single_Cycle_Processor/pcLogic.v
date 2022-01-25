module pcLogic (
  input             clk, reset,
  input      [31:0] PCIn,
  output reg [31:0] PCOut
);

// simple resetablle dff

always @(posedge clk or posedge reset)
  if (reset) PCOut <= 32'b0;
  else       PCOut <= PCIn;

endmodule