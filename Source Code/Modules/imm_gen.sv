// -------------------------------------------------------------------
// Module: imm_gen
// Description: Immediate generator for I-type, B-Type and J-type instructions
// Author: Awais Asghar
// Notes: Supports I-type (e.g., addi, jalr), B-Type  and J-type (e.g., jal)
// -------------------------------------------------------------------

module imm_gen (
    input  logic [31:0] instruction,  
    output logic [31:0] imm_out       
);

    logic [6:0] opcode;
    assign opcode = instruction[6:0];

    always_comb begin
        case (opcode)
            7'b1101111: begin // JAL (J-type)
                imm_out = {{12{instruction[31]}},       // sign extension
                           instruction[19:12],          // imm[19:12]
                           instruction[20],             // imm[11]
                           instruction[30:21],          // imm[10:1]
                           1'b0};                       // imm[0] = 0
            end

            7'b1100011: begin //B-Type
                imm_out = {
                          {19{instruction[31]}},    // sign extension with 12th bit 
                           instruction[31],         // imm[12]
                           instruction[7],          // imm[11]
                           instruction[30:25],      // imm[5:10]
                           instruction[11:8],        // imm[1:4]
                           1'b0                      // imm[0] = 0
                           };     
            end
            
            7'b0100011: begin // S-Type
                 imm_out = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end
            
            7'b0110111, // U-Type
            7'b0010111: begin 
                imm_out = { instruction[31:12], 12'b0 };
            end

            7'b1100111, // JALR (I-Type)
            7'b0000011, // Load (I-Type)
            7'b0010011: begin // I-Type (addi, andi, etc.)
                imm_out = {{20{instruction[31]}}, instruction[31:20]};
            end
            default: imm_out = 32'd0; // For unsupported types
        endcase
    end

endmodule