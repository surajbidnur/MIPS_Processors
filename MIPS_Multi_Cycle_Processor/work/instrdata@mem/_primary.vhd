library verilog;
use verilog.vl_types.all;
entity instrdataMem is
    port(
        clk             : in     vl_logic;
        wrEn            : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        wrData          : in     vl_logic_vector(31 downto 0);
        rdData          : out    vl_logic_vector(31 downto 0)
    );
end instrdataMem;
