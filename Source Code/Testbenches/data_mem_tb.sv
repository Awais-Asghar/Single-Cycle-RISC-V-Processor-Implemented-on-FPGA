`timescale 1ns/1ps

module data_mem_tb;

    logic clk;
    logic [31:0] addr;
    logic [31:0] dataW;
    logic [2:0]  funct3;
    logic        MemRW;
    logic [31:0] dataR;

    data_mem uut (
        .clk(clk),
        .addr(addr),
        .dataW(dataW),
        .funct3(funct3),
        .MemRW(MemRW),
        .dataR(dataR)
    );

    always #5 clk = ~clk;

    initial begin
        $display("=== Data Memory Store/Load Test ===");

        clk = 0;
        MemRW = 0;
        addr = 0;
        dataW = 0;
        funct3 = 3'b010;

        #10;

        // === store word at address 0x08 ===
        addr = 32'h00000008;
        dataW = 32'h12345678;
        funct3 = 3'b010;
        MemRW = 1;
        #10;

        // === store byte at address 0x09 ===
        addr = 32'h00000009;
        dataW = 32'h000000AB;
        funct3 = 3'b000; 
        MemRW = 1;
        #10;

        // === store halfword at address 0x0A ===
        addr = 32'h0000000A;
        dataW = 32'h0000FACE;
        funct3 = 3'b001; 
        MemRW = 1;
        #10;

        // Stop writing
        MemRW = 0;
        #10;  

        // === load word from 0x08 ===
        addr = 32'h00000008;
        funct3 = 3'b010; 
        #10;
        $display("Read lw  @ 0x08: 0x%08h", dataR);

        // === load byte from 0x09 ===
        addr = 32'h00000009;
        funct3 = 3'b000; 
        #10;
        $display("Read lb  @ 0x09: 0x%08h", dataR);

        // === load halfword from 0x0A ===
        addr = 32'h0000000A;
        funct3 = 3'b001; 
        #10;
        $display("Read lh  @ 0x0A: 0x%08h", dataR);
        #10;

        // === Dump memory to file ===
        $writememh("data_out.mem", uut.memory);
        $display("Memory successfully written to data_out.mem");

        $finish;
    end

endmodule