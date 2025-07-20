`timescale 1ns/1ps

module reg_file_tb;

    parameter REGF_WIDTH = 32;

    logic clk;
    logic write_en;
    logic [4:0] rs1, rs2, rsW;
    logic [REGF_WIDTH-1:0] write_data;
    logic [REGF_WIDTH-1:0] read_data1, read_data2;

    reg_file #(REGF_WIDTH) dut (
        .clk(clk),
        .write_en(write_en),
        .rs1(rs1),
        .rs2(rs2),
        .rsW(rsW),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        $display("=== Register File Test Start ===");

        clk = 0;
        write_en = 0;
        rs1 = 0; rs2 = 0; rsW = 0; write_data = 0;

        #10;

        // Try writing to x0 (should NOT change)
        write_en = 1;
        rsW = 5'd0;
        write_data = 32'hDEADBEEF;
        #10;

        // Write to x5
        rsW = 5'd5;
        write_data = 32'd12345;
        #10;

        // Write to x10
        rsW = 5'd10;
        write_data = 32'd54321;
        #10;

        write_en = 0;

        // Read x0 and x5
        rs1 = 5'd0;
        rs2 = 5'd5;
        #1;
        $display("Read x0 = %0d (expected 0), x5 = %0d (expected 12345)", read_data1, read_data2);

        // Read x10 and x0
        rs1 = 5'd10;
        rs2 = 5'd0;
        #1;
        $display("Read x10 = %0d (expected 54321), x0 = %0d (expected 0)", read_data1, read_data2);

        $display("Check 'reg_out.mem' for final register values.");
        $display("=== Register File Test Complete ===");

        $finish;
    end

endmodule
