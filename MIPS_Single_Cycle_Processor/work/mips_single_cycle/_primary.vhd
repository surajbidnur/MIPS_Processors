library verilog;
use verilog.vl_types.all;
entity mips_single_cycle is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end mips_single_cycle;
