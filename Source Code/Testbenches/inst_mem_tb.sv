`timescale 1ns/1ps

module inst_mem_tb;
    logic [31:0] addr;
    logic [31:0] inst;

    inst_mem dut (
        .addr(addr),
        .inst(inst)
    );

    task read_instruction(input int index);
        begin
            addr = index * 4; // Multiplying because word-aligned address
            #1;
            $display("memory[%0d] = 0x%08h", index, inst);
        end
    endtask

    initial begin
        $display("=== FULL INSTRUCTION MEMORY TEST ===");
        #5;

        // Total instructions in the instruction.mem file = 84
        for (int i = 0; i < 84; i++) begin
            read_instruction(i);
        end
        $display("=== END OF TEST ===");
        $finish;
    end
endmodule