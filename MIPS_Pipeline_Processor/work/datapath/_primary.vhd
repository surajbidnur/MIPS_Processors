library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        MemtoReg_ID     : in     vl_logic;
        MemWrite_ID     : in     vl_logic;
        ALUSrc_ID       : in     vl_logic;
        RegDst_ID       : in     vl_logic;
        RegWrite_ID     : in     vl_logic;
        Branch_ID       : in     vl_logic;
        ALUControl_ID   : in     vl_logic_vector(2 downto 0);
        fwdA_EX_HU      : in     vl_logic_vector(1 downto 0);
        fwdB_EX_HU      : in     vl_logic_vector(1 downto 0);
        Stall_ID_HU     : in     vl_logic;
        Stall_IF_HU     : in     vl_logic;
        Flush_EX_HU     : in     vl_logic;
        SrcAfwd_ID      : in     vl_logic;
        SrcBfwd_ID      : in     vl_logic;
        Rs_EX_HU        : out    vl_logic_vector(4 downto 0);
        Rt_EX_HU        : out    vl_logic_vector(4 downto 0);
        Rs_ID_HU        : out    vl_logic_vector(4 downto 0);
        Rt_ID_HU        : out    vl_logic_vector(4 downto 0);
        WriteReg_MEM_HU : out    vl_logic_vector(4 downto 0);
        WriteReg_WB_HU  : out    vl_logic_vector(4 downto 0);
        WriteReg_EX_HU  : out    vl_logic_vector(4 downto 0);
        RegWrite_MEM_HU : out    vl_logic;
        RegWrite_WB_HU  : out    vl_logic;
        MemtoReg_EX_HU  : out    vl_logic;
        Branch_ID_HU    : out    vl_logic;
        RegWrite_EX_HU  : out    vl_logic;
        MemtoReg_MEM_HU : out    vl_logic;
        OPCode          : out    vl_logic_vector(5 downto 0);
        Funct           : out    vl_logic_vector(5 downto 0)
    );
end datapath;
