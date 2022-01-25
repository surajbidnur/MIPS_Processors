quit -sim

# compile all files
project compileall

# start simulation
vsim work.mips_multi_cycle_tb

# set global radix as hexadecimal
radix -hex

# load all wave signals
do wave.do

# delete previously defines radix
radix delete *

# define radic to display on wave in simulation
radix define OPCODE {
  6'b000000 "R-Type",
  6'b100011 "LW",
  6'b101011 "SW",
  6'b000100 "BEQ",
  6'b001000 "ADDI",
  6'b000010 "J",
  -default hex
}

radix define ALUCTRL {
  3'b000 "AND",
  3'b001 "OR",
  3'b010 "ADD",
  3'b110 "SUB",
  3'b111 "SLT",
  -default hex
}

radix define STATE {
  4'h0 "FETCH",
  4'h1 "DECODE",
  4'h2 "MEMADR",
  4'h3 "MEMRD"
  4'h4 "MEMWB",
  4'h5 "MEMWR",
  4'h6 "EXE",
  4'h7 "ALUWB",
  4'h8 "BR",
  4'h9 "ADDIEX",
  4'hA "ADDIWB",
  4'hB "JUMP",
  -default hex
}

# set radix to particular waves
radix signal sim:/mips_multi_cycle_tb/mips/ctrlU/maindec/OPCode OPCODE
radix signal sim:/mips_multi_cycle_tb/mips/dp/OPCode OPCODE
radix signal sim:/mips_multi_cycle_tb/mips/dp/alu1/ALUCtrl ALUCTRL
radix signal sim:/mips_multi_cycle_tb/mips/ctrlU/aludec/ALUControl ALUCTRL
radix signal sim:/mips_multi_cycle_tb/mips/ctrlU/maindec/currState STATE
radix signal sim:/mips_multi_cycle_tb/mips/ctrlU/maindec/nextState STATE

# run simulation
run -all