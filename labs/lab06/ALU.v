module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUop,
    output reg [31:0] Result,
);

always @(*) begin
    case(AlUop) 
        3'b000: Result = A+B;
        3'b001: Result = A-B;
        3'b010: Result = A&B;
        3'b011: Result = A|B;
        default: Result = 31'b0;
    endcase
end 

endmodule