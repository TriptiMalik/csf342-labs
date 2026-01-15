
module dut(
    input[3:0] d,
    input clk,
    input reset,
    output[3:0] q
);

DFF D0(.d(d[0]),.clk(clk),.reset(reset),.q(q[0]));
DFF D1(.d(d[1]),.clk(clk),.reset(reset),.q(q[1]));
DFF D2(.d(d[2]),.clk(clk),.reset(reset),.q(q[2]));
DFF D3(.d(d[3]),.clk(clk),.reset(reset),.q(q[3]));

endmodule