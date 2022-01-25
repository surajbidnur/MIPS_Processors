module mips_pipeline_processor_tb ();
//cpu testbench

reg clk, reset;

mips_pipeline_processor mips (.clk(clk), .reset(reset));

always #5 clk = !clk;

initial begin
	clk = 0;
	reset = 1;
	
	#2 reset = 0;
  #6 reset = 1;

	#3000 $stop;

end

endmodule