module mainDecoder (
  input            clk, reset,
  input      [5:0] OPCode,
  output reg       MemtoReg, RegDst, IorD, ALUSrcA,
  output reg [1:0] PCSrc, ALUSrcB,
  output reg       IRWrite, MemWrite, PCWrite, Branch, RegWrite,
  output reg [1:0] ALUOp
);

// state machine to generate the control signals for the multi-cycle processor
// lw - 5 cycles
// sw - 4 cycles
// r-type - 4 cycles
// beq - 3 cycles
// addi - 4 cycles
// j - 3 cycles

reg [3:0] currState, nextState;

// OPCode enumeration
localparam [5:0] RT   = 6'b000000,
                 LW   = 6'b100011,
                 SW   = 6'b101011,
                 BEQ  = 6'b000100,
                 ADDI = 6'b001000,
                 J    = 6'b000010;

// state enumeration
localparam [3:0] FETCH   = 4'h0,
                 DECODE  = 4'h1,
                 MEMADR  = 4'h2,
                 MEMRD   = 4'h3,
                 MEMWB   = 4'h4,
                 MEMWR   = 4'h5,
                 EXE     = 4'h6,
                 ALUWB   = 4'h7,
                 BR      = 4'h8,
                 ADDIEX  = 4'h9,
                 ADDIWB  = 4'hA,
                 JUMP    = 4'hB;

// seq logic/ state update
always @(posedge clk or posedge reset) begin
  if (reset) currState <= FETCH;
  else       currState <= nextState;
end

// state transition logic combinational
always @(*) begin
  nextState = 4'hx;
  case (currState)
    FETCH: begin
      nextState = DECODE;
    end

    DECODE: begin
      if      (OPCode == LW || OPCode == SW) nextState = MEMADR;
      else if (OPCode == RT)                 nextState = EXE;
      else if (OPCode == BEQ)                nextState = BR;
      else if (OPCode == ADDI)               nextState = ADDIEX;
      else if (OPCode == J)                  nextState = JUMP;
    end

    MEMADR: begin
      if      (OPCode == LW) nextState = MEMRD;
      else if (OPCode == SW) nextState = MEMWR;
    end
    
    MEMRD: begin
      nextState = MEMWB;
    end

    MEMWB: begin
      nextState = FETCH;
    end

    MEMWR: begin
      nextState = FETCH;
    end

    EXE: begin
      nextState = ALUWB;
    end

    ALUWB: begin
      nextState = FETCH;
    end

    BR: begin
      nextState = FETCH;
    end

    ADDIEX: begin
      nextState = ADDIWB;
    end

    ADDIWB: begin
      nextState = FETCH;
    end

    JUMP: begin
      nextState = FETCH;
    end
    default: ;
  endcase
end

// registered output logic
always @(posedge clk or posedge reset) begin
  if (reset) begin
    {MemtoReg, RegDst, IorD, ALUSrcA, PCSrc, ALUSrcB} <= 8'bxxxx_xx_xx;  // select signals are dont care
    {IRWrite, MemWrite, PCWrite, Branch, RegWrite} <= 5'b00000;     // enable signals are 0
    ALUOp <= 2'bx;
  end
  else begin
    // defaults
    {MemtoReg, RegDst, IorD, ALUSrcA, PCSrc, ALUSrcB} <= 8'bxxxx_xx_xx;  // select signals are dont care
    {IRWrite, MemWrite, PCWrite, Branch, RegWrite} <= 5'b00000;     // enable signals are 0

    case (nextState)
      FETCH: begin
        {IorD, ALUSrcA, ALUSrcB, ALUOp, PCSrc, IRWrite, PCWrite} <= 10'b0_0_01_00_00_1_1;
      end

      DECODE: begin
        {ALUSrcA, ALUSrcB, ALUOp} <= 5'b0_11_00;
      end

      MEMADR: begin
        {ALUSrcA, ALUSrcB, ALUOp} <= 5'b1_10_00;
      end

      MEMRD: begin
        IorD <= 1'b1;
      end

      MEMWB: begin
        {RegDst, MemtoReg, RegWrite} <= 3'b0_1_1;
      end

      MEMWR: begin
        {IorD, MemWrite} <= 2'b1_1;
      end

      EXE: begin
        {ALUSrcA, ALUSrcB, ALUOp} <= 5'b1_00_10;
      end

      ALUWB: begin
        {RegDst, MemtoReg, RegWrite} <= 3'b1_0_1;
      end

      BR: begin
        {ALUSrcA, ALUSrcB, ALUOp, PCSrc, Branch} <= 8'b1_00_01_01_1;
      end

      ADDIEX: begin
        {ALUSrcA, ALUSrcB, ALUOp} <= 5'b1_10_00;
      end

      ADDIWB: begin
        {RegDst, MemtoReg, RegWrite} <= 3'b0_0_1;
      end

      JUMP: begin
        {PCSrc, PCWrite} <= 3'b10_1;
      end
      default: ;
    endcase
  end
end

endmodule