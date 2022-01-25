library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PCEn            : in     vl_logic;
        IorD            : in     vl_logic;
        MemWrite        : in     vl_logic;
        IRWrite         : in     vl_logic;
        RegDst          : in     vl_logic;
        MemtoReg        : in     vl_logic;
        RegWrite        : in     vl_logic;
        ALUSrcA         : in     vl_logic;
        PCSrc           : in     vl_logic_vector(1 downto 0);
        ALUSrcB         : in     vl_logic_vector(1 downto 0);
        ALUCtrl         : in     vl_logic_vector(2 downto 0);
        OPCode          : out    vl_logic_vector(5 downto 0);
        Funct           : out    vl_logic_vector(5 downto 0);
        Z               : out    vl_logic
    );
end datapath;
