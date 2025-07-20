`timescale 1ns/1ps

module program_counter_tb;

    logic clk;
    logic rst;
    logic [31:0] pc_next;
    logic [31:0] pc_out;

    program_counter dut (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        pc_next = 32'd0;
        #10 rst = 0;

        pc_next = 32'd4;
        #10;
        pc_next = 32'd8;
        #10;
        pc_next = 32'd12;
        #10;

        pc_next = 32'd100;
        #10;

        rst = 1;
        #10 rst = 0;

        pc_next = 32'd200;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time: %0t | rst=%b | pc_next=%0d | PC=%0d", $time, rst, pc_next, pc_out);
    end

endmodule