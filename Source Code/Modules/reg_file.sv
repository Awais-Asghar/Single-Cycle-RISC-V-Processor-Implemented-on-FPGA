// ----------------------------------------------------
// Module: reg_file
// Description: Read values from reg_init.mem and write values in the reg_out.mem
// Author: Awais Asghar
// Notes:  Make 2 files reg_init.mem and reg_out.mem and initialize them 
// ----------------------------------------------------

module reg_file #(
    parameter REGF_WIDTH = 32
)(
    input  logic clk,
    input  logic write_en,
    input  logic [4:0] rs1,
    input  logic [4:0] rs2,
    input  logic [4:0] rsW,
    input  logic [REGF_WIDTH-1:0] write_data,
    output logic [REGF_WIDTH-1:0] read_data1,
    output logic [REGF_WIDTH-1:0] read_data2
);

    logic [REGF_WIDTH-1:0] reg_file [0:31];

    assign read_data1 = (rs1 == 5'd0) ? 32'd0 : reg_file[rs1];
    assign read_data2 = (rs2 == 5'd0) ? 32'd0 : reg_file[rs2];

    initial begin
        $readmemh("reg_init.mem", reg_file);
    end

    always_ff @(posedge clk) begin
        if (write_en && rsW != 5'd0) begin
            reg_file[rsW] <= write_data;

        end
    end

endmodule