module mips_multi_cycle_tb ();

// testbench

reg clk, reset;

mips_multi_cycle mips (.clk(clk), .reset(reset));

always #5 clk = !clk;

initial begin
	clk = 1'b0;
	reset = 1'b1;
	
	#30 reset = 1'b0;

	#3000 $stop;

end

endmodule