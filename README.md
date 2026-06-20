# 8-bit-Computer

# 🧠 8-Bit Computer Architecture 

## 📌 Description

** The instruction set for this architecture is user-defined and will be provided externally. It is not fixed within the design and can be customized based on application requirements. The control unit is designed to decode and execute the provided instructions accordingly.**


## ⚙️ Specifications

* 8-bit data path architecture
* Modular Verilog HDL implementation
* FSM-based Control Unit for instruction sequencing
* Single shared internal bus system
* Fetch–Decode–Execute instruction cycle
* Dual-port RAM (16 × 8 configuration)
* Arithmetic Logic Unit supporting arithmetic and logical operations
* Flag register for status indication (Zero, Carry, etc.)
* Fully synchronous digital system design

---

## 🧩 System Modules

* Program Counter (PC)
* Memory Address Register (MAR)
* Dual Port RAM (16x8)
* Instruction Register (IR)
* Control Unit (FSM)
* Arithmetic Logic Unit (ALU)
* A Register (Accumulator)
* B Register
* Flag Register
* Output Register
* Bus System

---

## 🧱 Architecture Overview (Block Diagram)
<img width="1510" height="888" alt="image" src="https://github.com/user-attachments/assets/c6154510-bc9f-4e62-a64f-76bedfaf6fac" />


## 🔄 Instruction Cycle

* **T0:** PC → MAR
* **T1:** RAM → IR, PC increment
* **T2:** Instruction decode (Control Unit)
* **T3:** Operand fetch (if required)
* **T4+:** Execution via ALU / register transfer

## ISA
## Instruction Set Architecture (ISA)

| Opcode | Mnemonic | Description                              |
| ------ | -------- | ---------------------------------------- |
| `0000` | ADD      | Add memory operand to accumulator        |
| `0001` | SUB      | Subtract memory operand from accumulator |
| `0010` | INC      | Increment accumulator by 1               |
| `0011` | DEC      | Decrement accumulator by 1               |
| `0100` | ANDI     | Bitwise AND with memory operand          |
| `0101` | ORI      | Bitwise OR with memory operand           |
| `0110` | EXOR     | Bitwise Exclusive-OR with memory operand |
| `0111` | NOT      | Bitwise NOT of accumulator               |
| `1000` | LDA      | Load accumulator from memory             |
| `1001` | STA      | Store accumulator to memory              |
| `1010` | JMP      | Unconditional jump                       |
| `1011` | JC       | Jump if Carry flag is set                |
| `1100` | JZ       | Jump if Zero flag is set                 |
| `1101` | JNZ      | Jump if Zero flag is not set             |
| `1110` | LDI      | Load immediate data into accumulator     |
| `1111` | HLT      | Halt processor execution                 |

---     
## ⚙️ Development Platform
FPGA Board: Spartan-7 Boolean FPGA Board

Design Language: Verilog HDL

Design Methodology: RTL (Register Transfer Level)

Check Simulation [HERE](https://github.com/Meganthiyav/8_BIT_COMPUTER_ARCHITECTURE/tree/main/8_BIT_COMPUTER_ARCHITECTURE)
