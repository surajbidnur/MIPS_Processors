quit -sim
project compileall
vsim work.mips_pipeline_processor_tb
radix -hex
do wave.do
radix delete *
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
radix signal sim:/mips_pipeline_processor_tb/mips/ctrlU/maindec/OPCode OPCODE
radix signal sim:/mips_pipeline_processor_tb/mips/dp/alu1/ALUCtrl ALUCTRL
run -all