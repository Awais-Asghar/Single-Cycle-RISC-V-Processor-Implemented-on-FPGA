// ----------------------------------------------------
// Module: inst_mem
// Description: RISC-V Instruction Memory
// Author: Awais Asghar
// Notes: Loads 32-bit instructions from a file using $readmemh
// ----------------------------------------------------

module inst_mem (
    input  logic [31:0] addr,     
    output logic [31:0] inst      // Output instruction
);

    // 2KB of instruction memory = 256 words (32-bit each) 

    logic [31:0] memory [0:255];
    // Word alliged addresses or we can right shift it 
	 // e.g. as 4 8 12 becomes 1 2 3 and so on and it will be easy for us to calculate the index
	 assign inst = memory[addr[31:2]]; 

    initial begin
        $readmemh("instructions.mem", memory);
    end

endmodule 