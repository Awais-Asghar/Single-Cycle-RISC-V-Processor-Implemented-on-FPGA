`timescale 1ns/1ps

module imm_gen_tb;

    logic [31:0] instruction;
    logic [31:0] imm_out;

    imm_gen dut (
        .instruction(instruction),
        .imm_out(imm_out)
    );

    task test(input [31:0] instr, input string desc);
        begin
            instruction = instr;
            #1;
            $display("%s:\n  Instruction = 0x%08h | imm_out = %0d (0x%08h)\n", 
                     desc, instruction, $signed(imm_out), imm_out);
        end
    endtask

    initial begin
        $display("=== imm_gen Test Start ===");

        // ----- I-Type Tests -----
        test(32'b000000000101_00010_000_00101_0010011, "addi x5, x2, 5");
        test(32'b111111111101_00010_000_00101_0010011, "addi x5, x2, -3");
        test(32'b000000001100_00100_111_00011_0010011, "andi x3, x4, 12");

        // ----- JAL (J-Type) Tests -----
        test(32'h0100006f, "jal x1, 16");
        test(32'hff9ff06f, "jal x2, -8");

        // ----- JALR (I-Type) Test -----
        test(32'h00008067, "jalr x0, 0(x1)");

        // ----- B-Type Tests (beq) -----
        test(32'h00C58663, "beq x11, x12, offset = 12");
        test(32'hFEF506E3, "beq x10, x15, offset = -20");
        test(32'h00050063, "beq x10, x0, offset = 0");

        // ----- S-Type Tests (sw, sb, sh) -----
        test(32'h00B12023, "sw x11, 0(x2)");
        test(32'h00A12223, "sh x10, 4(x2)");
        test(32'h00912323, "sb x9, 8(x2)");

        // ----- U-Type Tests (LUI / AUIPC) -----
        test(32'h12345037, "lui x0, 0x12345");
        test(32'h12345117, "auipc x2, 0x12345");

        $display("=== imm_gen Test Complete ===");
        $finish;
    end

endmodule
