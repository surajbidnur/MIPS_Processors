library verilog;
use verilog.vl_types.all;
entity hazard_unit is
    port(
        Rs_EX_HU        : in     vl_logic_vector(4 downto 0);
        Rt_EX_HU        : in     vl_logic_vector(4 downto 0);
        Rs_ID_HU        : in     vl_logic_vector(4 downto 0);
        Rt_ID_HU        : in     vl_logic_vector(4 downto 0);
        WriteReg_MEM_HU : in     vl_logic_vector(4 downto 0);
        WriteReg_WB_HU  : in     vl_logic_vector(4 downto 0);
        WriteReg_EX_HU  : in     vl_logic_vector(4 downto 0);
        RegWrite_MEM_HU : in     vl_logic;
        RegWrite_WB_HU  : in     vl_logic;
        MemtoReg_EX_HU  : in     vl_logic;
        RegWrite_EX_HU  : in     vl_logic;
        MemtoReg_MEM_HU : in     vl_logic;
        Branch_ID_HU    : in     vl_logic;
        fwdA_EX_HU      : out    vl_logic_vector(1 downto 0);
        fwdB_EX_HU      : out    vl_logic_vector(1 downto 0);
        Stall_IF        : out    vl_logic;
        Stall_ID        : out    vl_logic;
        Flush_EX        : out    vl_logic;
        SrcAfwd_ID      : out    vl_logic;
        SrcBfwd_ID      : out    vl_logic
    );
end hazard_unit;
