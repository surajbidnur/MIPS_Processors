library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        clk             : in     vl_logic;
        rdAddr1         : in     vl_logic_vector(4 downto 0);
        rdAddr2         : in     vl_logic_vector(4 downto 0);
        wrAddr          : in     vl_logic_vector(4 downto 0);
        regWrite        : in     vl_logic;
        wrData          : in     vl_logic_vector(31 downto 0);
        rdData1         : out    vl_logic_vector(31 downto 0);
        rdData2         : out    vl_logic_vector(31 downto 0)
    );
end reg_file;
