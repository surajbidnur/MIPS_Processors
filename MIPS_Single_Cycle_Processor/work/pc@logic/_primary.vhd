library verilog;
use verilog.vl_types.all;
entity pcLogic is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PCIn            : in     vl_logic_vector(31 downto 0);
        PCOut           : out    vl_logic_vector(31 downto 0)
    );
end pcLogic;
