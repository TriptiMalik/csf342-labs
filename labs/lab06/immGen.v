module immGen(
    input [1:0] immSel,
    input [31:0] instruction,
    output [31:0] immOut,
);

wire [31:0] immI, immS, immB;

assign immI = {{20{instruction[31]}}, instruction[31:20]};

assign immS = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

assign immB = {{19{instruction[31]}}, instruction[31], instrcution[7], instrcution[30:25], instrcution[11:8], 1'b0};

assign immOut = (immSel == 2'b00) ? immI : (immSel == 2'b01) ? immS : (immSel == 2'b10) ? immB : 32'b0;

endmodule 