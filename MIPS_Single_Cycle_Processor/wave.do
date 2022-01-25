onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_single_cycle_tb/mips/clk
add wave -noupdate /mips_single_cycle_tb/mips/reset
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcl/PCIn
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcl/PCOut
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcPlus4/a
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcPlus4/b
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcPlus4/y
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcmux/a
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcmux/b
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcmux/sel
add wave -noupdate /mips_single_cycle_tb/mips/dp/pcmux/y
add wave -noupdate /mips_single_cycle_tb/mips/dp/jmux/a
add wave -noupdate /mips_single_cycle_tb/mips/dp/jmux/b
add wave -noupdate /mips_single_cycle_tb/mips/dp/jmux/sel
add wave -noupdate /mips_single_cycle_tb/mips/dp/jmux/y
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/OPCode
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/ALUOp
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/Funct
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/ALUControl
add wave -noupdate /mips_single_cycle_tb/mips/dp/alu1/srcA
add wave -noupdate /mips_single_cycle_tb/mips/dp/alu1/srcB
add wave -noupdate /mips_single_cycle_tb/mips/dp/alu1/ALUResult
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/Zero
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/MemtoReg
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/MemWrite
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/ALUSrc
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/RegDst
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/RegWrite
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/Jump
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/PCSrc
add wave -noupdate /mips_single_cycle_tb/mips/ctrlU/Branch
add wave -noupdate /mips_single_cycle_tb/mips/dp/imem1/a
add wave -noupdate /mips_single_cycle_tb/mips/dp/imem1/instr
add wave -noupdate /mips_single_cycle_tb/mips/dp/imem1/imem
add wave -noupdate /mips_single_cycle_tb/mips/dp/dmem1/wrEn
add wave -noupdate /mips_single_cycle_tb/mips/dp/dmem1/addr
add wave -noupdate /mips_single_cycle_tb/mips/dp/dmem1/wrData
add wave -noupdate /mips_single_cycle_tb/mips/dp/dmem1/rdData
add wave -noupdate /mips_single_cycle_tb/mips/dp/dmem1/dmem
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/rdAddr1
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/rdAddr2
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/wrAddr
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/regWrite
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/wrData
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/rdData1
add wave -noupdate /mips_single_cycle_tb/mips/dp/rf/rdData2
add wave -noupdate -expand /mips_single_cycle_tb/mips/dp/rf/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {88 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
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
WaveRestoreZoom {38 ps} {89 ps}
