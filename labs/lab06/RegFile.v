module RegFile(
    input clk,
    input RegWrite,
    input [4:0] rs1, rs2, rd,
    input [31:0] writeData,
    output [31:0] readData1,
    output [31:0] readData2,
);

reg [31:0] registers [0:31];

assign readData1 = registers[rs1];
assign readData2 = registers[rs2];

always @(posedge clk) begin 
    if(RegWrite && rd != 0)
        registers[rd] <= writeData;
end

endmodule