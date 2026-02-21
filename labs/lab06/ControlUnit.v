module ControlUnit(
    input [31:0] instruction,
    output reg RegWrite,
    output reg ALUsrc,
    output reg MemWrite,
    output reg MemRead,
    output reg [2:0] ALUop,
    output reg [1:0] immSel,
);

wire [6:0] opcode = instrcution[6:0];
wire [2:0] funct3 = instrcution[14:12];
wire [6:0] funct7 = instrcution [31:25];

always @(*) begin 
    RegWrite = 0;
    ALUsrc = 0;
    MemWrite = 0;
    MemRead = 0;
    ALUop = 3'b000;
    immSel = 2'b00;

    case(opcode) 
        7'b0110011: begin 
            RegWrite = 1;
            ALUsrc = 0;

            case({funct7, funct3})
                10'b0000000000: ALUOp = 3'b000; 
                10'b0100000000: ALUOp = 3'b001; 
                10'b0000000111: ALUOp = 3'b010; 
                10'b0000000110: ALUOp = 3'b011; 
            endcase
        end

        7'b0010011: begin 
            RegWrite = 1;
            ALUsrc = 1;
            ImmSel = 2'b00;

            case(funct3) 
                3'b000: ALuop = 3'b000;
                3'b111: ALUop = 3'b010;
            endcase
        end 

        7'b0000011: begin 
            RegWrite = 1;
            ALUsrc = 1;
            MemRead = 1;
            ImmSel = 2'b00;
            ALUop = 3'b000;

        end

        7'b0100011: begin 
            ALUsrc = 1;
            MemWrite = 1;
            immSel = 2'b01;
            ALUop = 3'b000;
        end

    endcase

end 

endmodule