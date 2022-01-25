library verilog;
use verilog.vl_types.all;
entity controlUnit is
    port(
        OPCode          : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        Zero            : in     vl_logic;
        MemtoReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegDst          : out    vl_logic;
        RegWrite        : out    vl_logic;
        Jump            : out    vl_logic;
        ALUControl      : out    vl_logic_vector(2 downto 0);
        PCSrc           : out    vl_logic
    );
end controlUnit;
