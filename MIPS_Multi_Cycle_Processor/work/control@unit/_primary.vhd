library verilog;
use verilog.vl_types.all;
entity controlUnit is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        OPCode          : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        Zero            : in     vl_logic;
        MemtoReg        : out    vl_logic;
        RegDst          : out    vl_logic;
        IorD            : out    vl_logic;
        ALUSrcA         : out    vl_logic;
        PCSrc           : out    vl_logic_vector(1 downto 0);
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        IRWrite         : out    vl_logic;
        MemWrite        : out    vl_logic;
        RegWrite        : out    vl_logic;
        PCEn            : out    vl_logic;
        ALUControl      : out    vl_logic_vector(2 downto 0)
    );
end controlUnit;
