`timescale 1ns / 1ps

module top_tb;

    logic clk;
    logic reset;
    logic [31:0] alu_result_out;
    logic        MemRW;
    logic        reg_write_en;
    logic [31:0] data_mem_out;

    top dut (
        .clk(clk),
        .reset(reset),
        .alu_result_out(alu_result_out),
        .MemRW(MemRW),
        .reg_write_en(reg_write_en),
        .data_mem_out(data_mem_out)
    );

    always #5 clk = ~clk;

    task display_state;
        $display("Time: %0t | PC=0x%08h | Inst=0x%08h | rs1=x%0d=0x%08h | rs2=x%0d=0x%08h | rd=x%0d | alu_op=%b | alu_result=0x%08h | MemRW=%b | RegWrite=%b | MemOut=0x%08h",
            $time,
            dut.pc,
            dut.instruction,
            dut.rs1, dut.reg_data1,
            dut.rs2, dut.reg_data2,
            dut.rd,
            dut.alu_op,
            alu_result_out,
            MemRW,
            reg_write_en,
            data_mem_out
        );
    endtask

    initial begin
        $display("==== RISC-V Top Module Testbench Started ====");
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
    end

    initial begin
        repeat (100) begin
            #10;
            display_state();
        end

        $display("==== Simulation Ended ====");
        $writememh("reg_out.mem", dut.rf.reg_file);
        $writememh("data_out.mem", dut.dmem.memory);
        $finish;
    end

endmodule
