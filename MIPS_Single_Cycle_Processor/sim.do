quit -sim

# compile all files
project compileall

# start simulation
vsim work.mips_single_cycle_tb

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

# set radix to particular waves
radix signal sim:/mips_single_cycle_tb/mips/ctrlU/OPCode OPCODE
radix signal sim:/mips_single_cycle_tb/mips/ctrlU/ALUControl ALUCTRL

# run simulation
run -all