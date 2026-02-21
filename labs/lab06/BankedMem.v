module BankedMem(
    input clk,
    input writeEn,
    input [31:0] address,
    input [31:0] writeData,
    output [31:0] readData,
);

reg [7:0] b0 [0:1023];
reg [7:0] b1 [0:1023];
reg [7:0] b2 [0:1023];
reg [7:0] b3 [0:1023];

wire [9:0] wordAddr;

assign wordAddr = address[11:2];

assign readData = {b3[wordAddr], b2[wordAddr], b1[wordAddr], b0[wordAddr]};

always @(posedge clk) begin 
    if(writeEn) begin
        b0[wordAddr] <= writeData[7:0];
        b1[wordAddr] <= writeData[15:8];
        b2[wordAddr] <= writeData[23:16];
        b3[wordAddr] <= writeData[31:24];
    end
end

endmodule 