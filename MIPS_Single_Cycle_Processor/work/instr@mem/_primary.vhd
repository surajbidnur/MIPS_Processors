library verilog;
use verilog.vl_types.all;
entity instrMem is
    port(
        a               : in     vl_logic_vector(5 downto 0);
        instr           : out    vl_logic_vector(31 downto 0)
    );
end instrMem;
