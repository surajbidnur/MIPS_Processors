# MIPS_Processors
Verilog implementation of the MIPS single cycle, multi cycle and pipeline processor architectures

---

## About

This repository contains 3 different implementations of the MIPS processor arcitecture. Only a very small subset of the actual ISA is implemented in these designs.
The different implementations are:

1. Single Cycle Processor
2. Multi Cycle Processor
3. Pipelined Processor

Each implementation is contained in its own folder with the appropriate name.

All the files are written in verilog. They were compiled and simulated using Modelsim.

---

### Single Cycle Processor

A single cycle processor completely processes each instruction in one cycle.

Advantage:

* The design is simple 

Disadvantage:

* The maximum processor clock frequency now depends on the time taken by the slowest instruction to complete.
* Next instruction starts only after the completion of the previous instruction. This degrades performance.

---

### Multi Cycle Processor

To improve the performance over the single cycle processor, the multicycle processor divides the instruction over multiple cycles.

Number of cycles instructions take to execute:

* lw - 5 cycles
* sw - 4 cycles
* and, or, sub, add, slt - 4 cycles each
* beq - 3 cycles
* addi - 4 cycles
* j - 3 cycles

Advantage:

* Processor can run at faster clock speeds compared to single cycle processor.
* This particular implementation also reduces the number of adder and memory units used. So overall cost and area is now reduced.

Disadvantage:

* Number of program execution cycles increases compared to the single cycle processor.
* Processor control beocmes more complicated compared to single cycle processor.

---

### Pipelined Processor

In a pipelined processor, the main focus is achieving better throughput in terms of instructions per second. The whole datapath is divided into stages which perform specific tasks each clock cycle. In this implementation the processor has 5 stages.

1. Instruction Fetch
2. Instruction Decode
3. Execute
4. Memory
5. Writeback

Advantage:

* Processor clock frequency increases as each stage can be optimized for best peroformance.
* Number of instruction per second increases so overall program execution tim reduces.

Disadvantage:

* A lot more hardware is required which increases cost.
* Pipelining introduces various hazards which if not handled will drastically reduce the performance of the processor.

This implementation of the pipelined processor includes some form of hazard detection and mitigation which includes data forwarding, stalling and pipeline flushing (control hazard).

---

### Instructions Supported

* add
* sub
* or
* and
* slt
* beq
* addi
* lw
* sw
* j (not supported in the pipelined processor)

For more details about the instructions please refer to the link in the references section below.

---

### References

I used the "Digital design and Computer Architecture" textbook by "David M. Harris and Sarah L. Harris" as a reference for the design of these processors.

The processor block diagram can also be found in this book.

For the MIPS ISA reference, use this [link](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_help.html)