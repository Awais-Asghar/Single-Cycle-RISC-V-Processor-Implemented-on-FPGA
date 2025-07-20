`timescale 1ns/1ps

module alu_logic_tb;

    parameter ALU_WIDTH = 32;
    logic [ALU_WIDTH-1:0] op1, op2;
    logic [3:0] alu_op;
    logic [ALU_WIDTH-1:0] result;

    alu_logic #(ALU_WIDTH) dut (
        .op1(op1),
        .op2(op2),
        .alu_op(alu_op),
        .result(result)
    );

    task test(input [ALU_WIDTH-1:0] a, input [ALU_WIDTH-1:0] b, input [3:0] op, input string label);
        begin
            op1 = a;
            op2 = b;
            alu_op = op;
            #1;
            $display("%s: op1 = %0d, op2 = %0d => result = %0d (hex: 0x%08h)", label, op1, op2, result, result);
        end
    endtask

    initial begin
        $display("=== ALU Logic Test Start ===");

        test(10, 5, 4'b0000, "ADD");				  // 15
        test(10, 5, 4'b0001, "SUB");				  // 5
        test(8,  1, 4'b0010, "SLL");				  // 16
        test(-2, 1, 4'b0011, "SLT (signed)");     // -2 < 1 => 1
        test(2, 5, 4'b0011, "SLT (signed)");      // 2 < 5 => 1
        test(5, 2, 4'b0100, "SLTU (unsigned)");   // 5 < 2 => 0 (unsigned)
        test(2, 5, 4'b0100, "SLTU (unsigned)");   // 2 < 5 => 1
        test(8,  3, 4'b0101, "XOR");				  // 11
        test(32'hF000_0000, 4, 4'b0110, "SRL");   // 251658240   or 0x0F000000
        test($signed(-32), 2, 4'b0111, "SRA");    // -8
        test(12, 5, 4'b1000, "OR");					  // 5
        test(15, 5, 4'b1001, "AND");				  // 4
        test(123, 0, 4'b1111, "DEFAULT CASE");    // Should return 0

        $display("=== ALU Logic Test Complete ===");
        $finish;
    end

endmodule
