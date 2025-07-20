// -----------------------------------------------------------
// Module: control_unit
// Description: RISC-V processor (supports R, I, S, B, J, LUI, AUIPC)
// Author: Awais Asghar
// Notes: Control Unit
// -----------------------------------------------------------

module control_unit (
    input  logic [6:0] opcode,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    input  logic       equal,
    input  logic       lessThan,
    output logic       alu_src,
    output logic       a_sel,
    output logic [3:0] alu_op,
    output logic       reg_write_en,
    output logic       mem_write,
    output logic       mem_to_reg,
    output logic [1:0] pc_src,
    output logic       branch_unsigned
);

    always_comb begin
        // Defaults
        alu_src         = 0;           // BSel
        alu_op          = 4'b0000;     // Used to select the operations like add, sub etc
        reg_write_en    = 0;           // RegWEn
        mem_write       = 0;           // MemRW
        mem_to_reg      = 0;           // Selects write-back data source; 0 = ALU result, 1 = Data memory output
        a_sel           = 0;           // ASel
        pc_src          = 2'b00;       // PC_Sel
        branch_unsigned = 0;

        case (opcode)
            7'b0110011: begin // R-type
                alu_src      = 0;
                reg_write_en = 1;
                case ({funct7, funct3})
                    10'b0000000000: alu_op = 4'b0000; // add
                    10'b0100000000: alu_op = 4'b0001; // sub
                    10'b0000000001: alu_op = 4'b0010; // sll
                    10'b0000000010: alu_op = 4'b0011; // slt
                    10'b0000000011: alu_op = 4'b0100; // sltu
                    10'b0000000100: alu_op = 4'b0101; // xor
                    10'b0000000101: alu_op = 4'b0110; // srl
                    10'b0100000101: alu_op = 4'b0111; // sra
                    10'b0000000110: alu_op = 4'b1000; // or
                    10'b0000000111: alu_op = 4'b1001; // and
                    default: alu_op = 4'b1111;
                endcase
            end

            7'b0010011: begin // I-type ALU
                alu_src      = 1;
                reg_write_en = 1;
                case (funct3)
                    3'b000: alu_op = 4'b0000; // addi
                    3'b010: alu_op = 4'b0011; // slti
                    3'b011: alu_op = 4'b0100; // sltiu
                    3'b100: alu_op = 4'b0101; // xori
                    3'b101: alu_op = (funct7 == 7'b0100000) ? 4'b0111 : 4'b0110; // srai/srli
                    3'b110: alu_op = 4'b1000; // ori
                    3'b111: alu_op = 4'b1001; // andi
                    default: alu_op = 4'b1111;
                endcase
            end

            7'b0000011: begin // Load
                alu_src      = 1;
                reg_write_en = 1;
                mem_write    = 0;
                mem_to_reg   = 1;
                alu_op       = 4'b0000;
            end

            7'b0100011: begin // Store
                alu_src    = 1;
                mem_write  = 1;
                alu_op     = 4'b0000;
            end

            7'b1100011: begin // Branch
                alu_src         = 0;
                branch_unsigned = (funct3 == 3'b110 || funct3 == 3'b111);
                case (funct3)
                    3'b000: if (equal)     pc_src = 2'b01; // beq
                    3'b001: if (!equal)    pc_src = 2'b01; // bne
                    3'b100: if (lessThan)  pc_src = 2'b01; // blt
                    3'b101: if (!lessThan) pc_src = 2'b01; // bge
                    3'b110: if (lessThan)  pc_src = 2'b01; // bltu
                    3'b111: if (!lessThan) pc_src = 2'b01; // bgeu
                endcase
            end

            7'b1101111: begin // JAL
                a_sel        = 1; // PC + offset in ALU
                reg_write_en = 1;
                pc_src       = 2'b01;
            end

            7'b1100111: begin // JALR
                reg_write_en = 1;
                pc_src       = 2'b10;
            end

            7'b0110111: begin // LUI
                alu_src      = 1;
                reg_write_en = 1;
                alu_op       = 4'b0000;
            end

            7'b0010111: begin // AUIPC
                a_sel        = 1;          // Use PC as ALU input A
                alu_src      = 1;          // Use Imm as ALU input B
                reg_write_en = 1;
                alu_op       = 4'b0000;    // Add
            end

            default: begin
                alu_op = 4'b1111;
            end
        endcase
    end

endmodule