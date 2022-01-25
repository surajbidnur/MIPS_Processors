onerror {resume}
radix define OPCODE {
    "6'b000000" "R-Type",
    "6'b100011" "LW",
    "6'b101011" "SW",
    "6'b000100" "BEQ",
    "6'b001000" "ADDI",
    "6'b000010" "J",
    -default hexadecimal
}
radix define ALUCTRL {
    "3'b000" "AND",
    "3'b001" "OR",
    "3'b010" "ADD",
    "3'b110" "SUB",
    "3'b111" "SLT",
    -default hexadecimal
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_pipeline_processor_tb/mips/clk
add wave -noupdate /mips_pipeline_processor_tb/mips/reset
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcPlus4/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcPlus4/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcPlus4/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/imem1/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/imem1/instr
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/imem1/imem
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/im_reg/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/im_reg/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcplus4_reg/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcplus4_reg/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/signext1/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/signext1/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/rdAddr1
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/rdAddr2
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/wrAddr
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/regWrite
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/wrData
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/rdData1
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd1mux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd1mux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd1mux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd1mux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/rdData2
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd2mux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd2mux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd2mux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd2mux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rf/mem
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/PCSrc_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/Equal_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srca_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srca_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wrdo_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wrdo_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rt_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rt_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/simm_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/simm_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/c
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcAfmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/c
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/srcBfmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluSrcBmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluSrcBmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluSrcBmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluSrcBmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alu1/srcA
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alu1/srcB
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alu1/ALUCtrl
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alu1/ALUResult
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alu1/Z
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rdrtmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rdrtmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rdrtmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rdrtmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/sl1/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/sl1/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcBranchadder/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcBranchadder/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/pcBranchadder/y
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alures_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alures_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wrdo_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wrdo_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wr_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/wr_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/dmem1/wrEn
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/dmem1/addr
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/dmem1/wrData
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/dmem1/rdData
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/dmem1/dmem
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alures_reg_memwb/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alures_reg_memwb/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd_reg_memwb/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/rd_reg_memwb/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/resmux/a
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/resmux/b
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/resmux/sel
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/resmux/y
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/OPCode
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/MemtoReg
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/MemWrite
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/Branch
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/Equal_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/ALUSrc
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/RegDst
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/maindec/RegWrite
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/aludec/ALUOp
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/aludec/Funct
add wave -noupdate /mips_pipeline_processor_tb/mips/ctrlU/aludec/ALUControl
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memwr_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memwr_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluctrl_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/aluctrl_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alusrc_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/alusrc_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regdst_reg_idex/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regdst_reg_idex/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memwr_reg_exmem/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memwr_reg_exmem/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_memwb/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/regwr_reg_memwb/q
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_memwb/d
add wave -noupdate /mips_pipeline_processor_tb/mips/dp/memtoreg_reg_memwb/q
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Rs_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Rt_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Rs_ID_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Rt_ID_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/WriteReg_MEM_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/WriteReg_WB_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/WriteReg_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/RegWrite_MEM_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/RegWrite_WB_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/MemtoReg_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/RegWrite_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/MemtoReg_MEM_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Branch_ID_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/fwdA_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/fwdB_EX_HU
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Stall_IF
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Stall_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Flush_EX
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/SrcAfwd_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/SrcBfwd_ID
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/lwStall
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/brStall
add wave -noupdate /mips_pipeline_processor_tb/mips/hu1/Stall
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 314
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {19 ps} {104 ps}
