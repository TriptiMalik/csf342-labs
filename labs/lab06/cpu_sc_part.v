module cpu_sc_part();

reg clk;
reg[31:0] PC;

wire [31:0] instruction;
wire RegWrite, ALUsrc, MemWrite, MemRead;
wire [2:0] ALUop;
wire [1:0] immSel;
wire [31:0] immOut;
wire [31:0] readData1, readData2;
wire [31:0] aluInputB;
wire [31:0] aluResult;
wire [31:0] memData;

initial clk = 0;
always #5 clk = ~clk;

initial PC = 0;
always @(posedge clk)
    PC <= PC + 4;

BankedMem IMEM(clk, 0, PC, 0, instruction);

ControlUnit CU(instrcution, RegWrite, ALUsrc, MemWrite, MemRead, ALUop, ImmSel);

RegFile RF(clk, RegWrite, instruction[19:15], instruction[24:20], instruction[11:7], memData, readData1, readData2);

immGen IG(ImmSel, instruction, immOut);

assign aluInputB = (ALUSrc) ? immOut : readData2;

ALU alu(readData1, aluInputB, ALUOp, aluResult);

BankedMEM DMEM(clk, MemWrite, aluResult, readData2, memData);

endmodule