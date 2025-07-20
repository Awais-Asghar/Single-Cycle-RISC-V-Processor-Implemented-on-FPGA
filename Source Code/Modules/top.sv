// -----------------------------------------------------------
// Module: top
// Description: RISC-V processor (supports R, I, S, B, J, LUI, AUIPC)
// Author: Awais Asghar
// -----------------------------------------------------------

module top (
    input  logic clk,
    input  logic reset,
    output logic [31:0] alu_result_out,
    output logic MemRW,
    output logic reg_write_en,
    output logic [31:0] data_mem_out
);

    // ---------------------- PC Logic ----------------------
    logic [31:0] pc, next_pc, pc_plus4;
    assign pc_plus4 = pc + 32'd4;

    // ---------------------- Instruction Fetch ----------------------
    logic [31:0] instruction;
    inst_mem imem (
        .addr(pc),
        .inst(instruction)
    );

    // ---------------------- Instruction Decode ----------------------
    logic [6:0]  opcode;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [4:0]  rs1, rs2, rd;

    always_comb begin
        opcode = instruction[6:0];
        rd     = instruction[11:7];
        funct3 = instruction[14:12];
        rs1    = instruction[19:15];
        rs2    = instruction[24:20];
        funct7 = instruction[31:25];
    end

    // ---------------------- Register File ----------------------
    logic [31:0] reg_data1, reg_data2, write_data;

    reg_file rf (
        .clk(clk),
        .write_en(reg_write_en),
        .rs1(rs1),
        .rs2(rs2),
        .rsW(rd),
        .write_data(write_data),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    // ---------------------- Immediate Generation ----------------------
    logic [31:0] imm_out;
    imm_gen immgen (
        .instruction(instruction),
        .imm_out(imm_out)
    );

    // ---------------------- ALU Logic ----------------------
    logic [3:0] alu_op;
    logic       alu_src;
    logic [31:0] alu_in1;
    logic [31:0] alu_in2;
    logic a_sel;   // ASel
    
    assign alu_in1 = (a_sel) ? pc : reg_data1;
    assign alu_in2 = (alu_src) ? imm_out : reg_data2;

    alu_logic alu (
        .op1(alu_in1),
        .op2(alu_in2),
        .alu_op(alu_op),
        .result(alu_result_out)
    );

    // ---------------------- Data Memory ----------------------
    data_mem dmem (
        .clk(clk),
        .addr(alu_result_out),
        .dataW(reg_data2),
        .funct3(funct3),
        .MemRW(MemRW),
        .dataR(data_mem_out)
    );

    // ---------------------- Writeback Mux ----------------------
    logic       mem_to_reg;  
    assign write_data = (pc_src == 2'b00) ?    // pc_src = WBSel
                            (mem_to_reg ? data_mem_out : alu_result_out)
                        : pc_plus4;

    // ---------------------- PC Selection Mux ----------------------
    logic [1:0] pc_src;
    logic [31:0] jalr_target;
    assign jalr_target = (reg_data1 + imm_out) & ~32'd1;

    always_comb begin
        case (pc_src)
            2'b00: next_pc = pc_plus4;
            2'b01: next_pc = pc + imm_out;
            2'b10: next_pc = jalr_target;
            default: next_pc = 32'd0;
        endcase
    end

    // -------------------- Program Counter --------------------
    logic [31:0] pc_next, pc_out;
    program_counter pc_inst (
        .clk(clk),
        .rst(reset),
        .pc_next(pc_next),
        .pc_out(pc_out)
    );

    assign pc = pc_out;
    assign pc_next = next_pc;

    // -------------------- Branch Comparator --------------------
    logic BrUn, BrEq, BrLt;

    branch_comp branch_comparator(
        .a(reg_data1),
        .b(reg_data2),
        .BrUn(BrUn),
        .BrEq(BrEq),
        .BrLt(BrLt)
    );

    // ---------------------- Control Unit ----------------------
    control_unit cu (
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .equal(BrEq),
        .lessThan(BrLt),
        .alu_src(alu_src),
        .a_sel(a_sel),
        .alu_op(alu_op),
        .reg_write_en(reg_write_en),
        .mem_write(MemRW),
        .mem_to_reg(mem_to_reg),
        .pc_src(pc_src),
        .branch_unsigned(BrUn)
    );

endmodule