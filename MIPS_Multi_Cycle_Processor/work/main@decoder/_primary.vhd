library verilog;
use verilog.vl_types.all;
entity mainDecoder is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        OPCode          : in     vl_logic_vector(5 downto 0);
        MemtoReg        : out    vl_logic;
        RegDst          : out    vl_logic;
        IorD            : out    vl_logic;
        ALUSrcA         : out    vl_logic;
        PCSrc           : out    vl_logic_vector(1 downto 0);
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        IRWrite         : out    vl_logic;
        MemWrite        : out    vl_logic;
        PCWrite         : out    vl_logic;
        Branch          : out    vl_logic;
        RegWrite        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0)
    );
end mainDecoder;
