// ----------------------------------------------------
// Module: alu_logic
// Description: ALU for R-type and I-type instructions
// Author: Awais Asghar
// Notes: Supports type of operations 
// ----------------------------------------------------

module alu_logic #(
    parameter ALU_WIDTH = 32
)(
    input  logic [ALU_WIDTH-1:0] op1,
    input  logic [ALU_WIDTH-1:0] op2,
    input  logic [3:0] alu_op,  // ALU operation code
    output logic [ALU_WIDTH-1:0] result
);

always_comb begin
    case (alu_op)
        4'b0000: result = op1 + op2;                             // ADD / ADDI / AUIPC
        4'b0001: result = op1 - op2;                             // SUB
        4'b0010: result = op1 << op2[4:0];                       // SLL
        4'b0011: result = ($signed(op1) < $signed(op2)) ? 1 : 0; // SLT / SLTI
        4'b0100: result = (op1 < op2) ? 1 : 0;                   // SLTU / SLTIU
        4'b0101: result = op1 ^ op2;                             // XOR / XORI
        4'b0110: result = op1 >> op2[4:0];                       // SRL / SRLI
        4'b0111: result = $signed(op1) >>> op2[4:0];             // SRA / SRAI
        4'b1000: result = op1 | op2;                             // OR / ORI
        4'b1001: result = op1 & op2;                             // AND / ANDI
        default: result = 32'd0;
    endcase
end
endmodule