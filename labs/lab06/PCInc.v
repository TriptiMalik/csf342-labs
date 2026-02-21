module PCInc(
    input clk,
    input [31:0] oldPC,
    output reg [31:0] newPC,
);

wire [31:0] pcPlus4;

Adder add4(.A(oldPC), .B(32'd4), .Sum(pcPlus4));

always @(posedge clk)
    newPC <= pcPlus4;


endmodule