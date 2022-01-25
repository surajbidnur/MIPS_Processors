module mips_single_cycle_tb ();

//mips single cycle processor testbench

reg clk, reset;

mips_single_cycle mips (.clk(clk), .reset(reset));

always #5 clk = !clk;

initial begin
	clk = 0;
	reset = 1;
	
	#30 reset = 0;

	#3000 $stop;

end

endmodule