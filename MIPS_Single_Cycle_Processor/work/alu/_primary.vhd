library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        srcA            : in     vl_logic_vector(31 downto 0);
        srcB            : in     vl_logic_vector(31 downto 0);
        ALUCtrl         : in     vl_logic_vector(2 downto 0);
        ALUResult       : out    vl_logic_vector(31 downto 0);
        Z               : out    vl_logic
    );
end alu;
