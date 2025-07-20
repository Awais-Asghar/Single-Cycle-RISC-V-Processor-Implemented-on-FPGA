module branch_comp_tb;

    logic [31:0] a, b;
    logic        BrUn;
    logic        BrEq, BrLt;

    branch_comp dut (
        .a(a),
        .b(b),
        .BrUn(BrUn),
        .BrEq(BrEq),
        .BrLt(BrLt)
    );

    task show_result;
        input string name;
        begin
            $display("[%s] a = %0d, b = %0d, BrUn = %0b -> BrEq = %0b, BrLt = %0b", 
                      name, a, b, BrUn, BrEq, BrLt);
        end
    endtask

    initial begin

        a = 32'd10; b = 32'd10; BrUn = 0;
        #1; show_result("Equal (signed)");

        a = -5; b = 3; BrUn = 0;
        #1; show_result("Less Than (signed)");

        a = 10; b = -20; BrUn = 0;
        #1; show_result("Greater Than (signed)");

        a = 32'h00000001; b = 32'hFFFFFFFF; BrUn = 1;
        #1; show_result("Less Than (unsigned)");

        a = 32'hFFFFFFFE; b = 32'h00000001; BrUn = 1;
        #1; show_result("Greater Than (unsigned)");

        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; BrUn = 1;
        #1; show_result("Equal (unsigned)");

        $finish;
    end

endmodule