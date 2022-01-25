library verilog;
use verilog.vl_types.all;
entity mips_multi_cycle is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end mips_multi_cycle;
