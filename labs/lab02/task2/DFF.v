
`timescale 1ns/1ps
module DFF (
  input wire clk,
  input wire d,
  input reset,
  output reg q
);
  always @(posedge clk, negedge reset) begin
  if(!reset)
    q<=0;
  else
    q <= d;
  end
endmodule
