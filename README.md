<img width="783" height="182" alt="image" src="https://github.com/user-attachments/assets/dbd00615-4568-4dbd-bede-c725aa46a21d" /># Single Cycle RISC-V Processor Implemented on FPGA

![Project Status](https://img.shields.io/badge/status-Completed-brightgreen.svg) 
![Platform](https://img.shields.io/badge/platform-FPGA-ff69b4.svg)
![Tool-Vivado](https://img.shields.io/badge/tool-Vivado-yellow.svg)
![FPGA-NexysA7](https://img.shields.io/badge/FPGA-NexysA7-orange.svg)
![Language-SystemVerilog](https://img.shields.io/badge/language-SystemVerilog-purple.svg)
![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/956f792a-1b05-4132-b913-46420a5c5f22" />

## Project Overview

This project implements a **Single-Cycle RISC-V Processor** using **SystemVerilog** on a **Nexys A7 (Artix-7) FPGA**. Project includes complete datapath and control logic with instruction memory, data memory, ALU, immediate generator, and branch comparator. It supports the complete **RV32I** instruction set (R, I, S, B, U, J types) and is optimized for educational clarity and hardware-software co-design learning.

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1e81a574-0be3-4391-8dc9-3c2f6db536f5" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/b51cd72f-06b7-41b5-bef1-1d2b9389708e" />

## Tools & Technologies

| Type       | Tool/Tech                          |
|------------|------------------------------------|
| **Hardware** | Nexys A7 FPGA (Artix-7, Digilent) |
| **Language** | SystemVerilog (HDL)               |
| **Software** | Xilinx Vivado (Simulation + Synthesis) |
| **Extras** | RISC-V Assembly, .mem files for memory preloading |

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/0dcc67be-e8d0-42b8-8f7f-ed95609f0ead" />

## Key Features

- **Single-Cycle Execution**  
  Executes one complete RISC-V instruction per clock cycle, enabling straightforward control logic and easier debugging.
- **Modular Design**  
  Each processor component (ALU, Control Unit, Register File, etc.) is developed as a reusable SystemVerilog module.
- **Full RV32I Support**  
  Supports all 32-bit base integer instruction types: R, I, S, B, U, and J.
- **Immediate Decoding & Sign Extension**  
  Fully functional Immediate Generator for all instruction formats with correct 32-bit sign-extension.
- **Memory Preloading**  
  Instruction memory, data memory, and register file can be initialized via `.mem` files for controlled simulation.
- **Simulation Verified**  
  All components tested with custom SystemVerilog testbenches in Xilinx Vivado simulator.
- **RTL & Timing Diagrams**  
  Visual representation of RTL structure and timing behavior captured using Vivado tools.
- **Synthesizable for FPGA**  
  Fully synthesizable and deployed on the Digilent Nexys A7 board (Artix-7 FPGA) without timing violations.
- **Educational Focus**  
  Designed to offer clarity and transparency in digital design, ideal for students learning computer architecture and hardware design.


## System Architecture
Each instruction follows 5 basic stages in **one cycle**:

1. Fetch
2. Decode
3. Execute
4. Memory Access
5. Write Back

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/406f5b0c-d809-4f69-882a-07e81c8d8aed" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/cb1e7627-d14e-4f5d-8768-5a2e1883272c" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/b9876118-de0e-43c5-92eb-e6a0806b4835" />

## Key Components 

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/07d2ea4f-a063-42ac-8059-9e315aba8eb9" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1916d857-fc88-479d-8d7c-c90fcc088132" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/4725c755-2366-4195-b361-0673942d88b0" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/9e67306c-1306-4831-85dd-ea9c92f5139f" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/dc6516dc-ae5c-4a4e-bf6e-40f42121d1ce" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/255da0a3-06cf-4284-97fe-b920b7ca4b08" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/40360ccd-b653-4637-9cbc-3331adafd777" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/e340d564-bd77-44e8-8f0b-ce0eb9b915ac" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1ce6a3d9-4b9a-465a-93ab-0557763bae86" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/a94c6b3c-bd02-488f-93be-f747610805fd" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/cfbc8172-31cc-4b82-8b51-3f5d4e6a5d38" />

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/6755b71f-7138-498c-b282-6be6b6659246" />

## Datapath and Control path

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/310b08bc-1928-4798-a280-ca950a03d237" />

## Implementation

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/d8d32274-6550-440d-b218-9dbf14edeaf0" />

## Testing and Results

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/676980c2-c31a-4707-9cf0-8affd89816b6" />

## RTL Diagrams
These RTL (Register Transfer Level) views were auto-generated using Xilinx Vivado. They illustrate the structural connectivity and module instantiations within the design.

### RTL schematic of the Top Module

<img width="940" height="150" alt="Image" src="https://github.com/user-attachments/assets/0fdac51d-36ca-48e9-a18c-e1c8afb345ec" />

### RTL schematic of the Control Unit Module

<img width="940" height="642" alt="Image" src="https://github.com/user-attachments/assets/ff3f63ca-c3f5-4045-a1dc-30ea88ab85fe" />

### RTL schematic of the Instruction Memory Module

<img width="783" height="182" alt="Image" src="https://github.com/user-attachments/assets/9df5b7d3-3635-4082-984e-be060113b7ba" />

### RTL schematic of the Branch Comparator Module

<img width="843" height="345" alt="Image" src="https://github.com/user-attachments/assets/c8331c1d-f9ec-4edd-b318-8c359bc6d6ad" />

### RTL schematic of the Immediate Generator Module

<img width="785" height="252" alt="Image" src="https://github.com/user-attachments/assets/9018f4db-630d-487e-8d38-400b20bafd77" />

### RTL schematic of the Register File Module

<img width="940" height="260" alt="Image" src="https://github.com/user-attachments/assets/7c6c7962-8562-406b-9e49-80d9cd15cf69" />

### RTL schematic of the Program Counter Module

<img width="880" height="291" alt="Image" src="https://github.com/user-attachments/assets/a66c1a33-4f6c-4e09-aa29-10be9ac224dd" />

### RTL schematic of the ALU Logic Module

<img width="940" height="572" alt="Image" src="https://github.com/user-attachments/assets/c6433717-e48f-4ae6-a4bf-fd1d15353821" />

### RTL schematic of the Data Memory Module

<img width="940" height="365" alt="Image" src="https://github.com/user-attachments/assets/e4959062-c967-43df-a9b9-ddcb6c24b13e" />

## Timing Diagrams

Timing diagrams were extracted from Vivado simulations to validate functional behavior.

### Top Module:

<img width="1504" height="652" alt="Image" src="https://github.com/user-attachments/assets/5fbe2133-b1d1-42df-a7b6-65ff9d0d119a" />

<img width="1504" height="629" alt="Image" src="https://github.com/user-attachments/assets/776195ab-bf2d-4c91-a39d-e4b3c5efcb7a" />

<img width="1503" height="413" alt="Image" src="https://github.com/user-attachments/assets/986af143-d9ce-467d-b31d-ab2c4c4d7ed2" />














## Project Folder Structure

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/39bdd504-6fb4-4796-b1b5-b430bd539a32" />

## Conclusion

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/ae9c79f0-36ff-4d2d-924d-bac0976cd780" />

## Future Enhancements

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/7e7a5c0a-f4da-481c-a8f3-cd45fe5e134e" />

## License

This project is licensed under the MIT License.

## Author

**Awais Asghar**  
**NUST Chip Design Centre** 

## Regards

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/7a725817-f117-4d2d-830d-dbb909154cc2" />

---
