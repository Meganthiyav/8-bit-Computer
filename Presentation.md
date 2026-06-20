# 🧠 8-Bit Computer Architecture on FPGA

## 🚀 Project Overview

This project presents the design and FPGA implementation of a fully functional **8-Bit Computer Architecture** developed using **Verilog HDL** and deployed on the **Spartan-7 Boolean FPGA Board**. The system demonstrates the complete instruction execution cycle of a simple processor, including instruction fetch, decode, execution, memory access, and output display.

The architecture follows a modular RTL design methodology and integrates fundamental processor components such as registers, memory, arithmetic logic unit, control unit, and a shared bus system. The design serves as an educational and practical demonstration of how modern processors operate at the hardware level.

---

## 🎯 Objectives

* Design a complete 8-bit processor from scratch using Verilog HDL.
* Understand processor datapath and control path implementation.
* Demonstrate instruction execution through a Fetch–Decode–Execute cycle.
* Implement memory operations, arithmetic operations, logical operations, and branching instructions.
* Deploy and verify the design on an FPGA platform.

---

## ✨ Key Features

* 8-bit Data Path Architecture
* FPGA Implementation on Spartan-7 Boolean Board
* Modular RTL-Based Design
* FSM-Based Control Unit
* Shared Internal Bus Architecture
* Dual-Port 16×8 RAM
* Arithmetic and Logical Instruction Support
* Conditional and Unconditional Branching
* Zero and Carry Flag Generation
* Real-Time Output Display on Seven-Segment Display
* Human-Observable Execution Using Clock Divider

---

## ⚙️ System Specifications

| Parameter          | Value                        |
| ------------------ | ---------------------------- |
| Architecture Width | 8-bit                        |
| Address Width      | 4-bit                        |
| Memory Size        | 16 × 8                       |
| Design Language    | Verilog HDL                  |
| Control Logic      | FSM Based                    |
| Clock Source       | 100 MHz FPGA Clock           |
| Execution Clock    | 6 Hz (via Clock Divider)     |
| FPGA Platform      | Spartan-7 Boolean FPGA Board |
| Design Methodology | RTL Design                   |

---

## 🏗️ System Modules

### Datapath Components

* Program Counter (PC)
* Memory Address Register (MAR)
* Instruction Register (IR)
* Accumulator Register (A Register)
* B Register
* Output Register
* Shared Bus System

### Processing Components

* Arithmetic Logic Unit (ALU)
* Flag Register

### Memory Components

* Dual-Port RAM (16 × 8)

### Control Components

* FSM-Based Control Unit
* Clock Divider

### Display Components

* Seven-Segment Display Controller

---

## 🧱 Architecture Overview

The processor is organized around a shared 8-bit internal bus. Data transfer between modules is controlled by the FSM-based Control Unit.

PC → MAR → RAM → IR

↓

Control Unit

↓

Registers ↔ Bus ↔ ALU

↓

Output Register

↓

Seven-Segment Display

The Control Unit generates all control signals required for register loading, memory access, ALU operation selection, and branching decisions.

---

## 🔄 Instruction Execution Cycle

### T0 – Fetch Address

PC → MAR

### T1 – Fetch Instruction

RAM → IR

PC ← PC + 1

### T2 – Decode Instruction

Instruction decoded by Control Unit

### T3 – Operand Fetch

Memory operand loaded if required

### T4 – Execute Instruction

ALU operation, memory access, register transfer, or branch execution

---

## 🧮 Instruction Set Architecture (ISA)

| Opcode | Mnemonic | Description                              |
| ------ | -------- | ---------------------------------------- |
| 0000   | ADD      | Add memory operand to accumulator        |
| 0001   | SUB      | Subtract memory operand from accumulator |
| 0010   | INC      | Increment accumulator                    |
| 0011   | DEC      | Decrement accumulator                    |
| 0100   | ANDI     | Logical AND operation                    |
| 0101   | ORI      | Logical OR operation                     |
| 0110   | EXOR     | Logical XOR operation                    |
| 0111   | NOT      | Logical NOT operation                    |
| 1000   | LDA      | Load accumulator from memory             |
| 1001   | STA      | Store accumulator into memory            |
| 1010   | JMP      | Unconditional jump                       |
| 1011   | JC       | Jump if carry flag is set                |
| 1100   | JZ       | Jump if zero flag is set                 |
| 1101   | JNZ      | Jump if zero flag is not set             |
| 1110   | LDI      | Load immediate data                      |
| 1111   | HLT      | Halt processor execution                 |

---

## 🔢 ALU Operations

The Arithmetic Logic Unit supports:

* Addition
* Subtraction
* Increment
* Decrement
* AND
* OR
* XOR
* NOT

The ALU generates:

* Carry Flag (C)
* Zero Flag (Z)

which are used for conditional branching instructions.

---

## 💡 FPGA Demonstration

The processor executes instructions at a slowed clock frequency of approximately 6 Hz, allowing real-time visualization of:

* Program Counter updates
* Memory accesses
* Instruction execution
* Register transfers
* Output display updates

The execution result is displayed on the onboard seven-segment display.

---

## 🔬 Verification

Each RTL module was individually verified through simulation before integration.

### Verified Modules

* Program Counter
* Memory Address Register
* Instruction Register
* Dual-Port RAM
* A Register
* B Register
* ALU
* Flag Register
* Output Register
* Control Unit
* Top-Level Computer Architecture

---

## 📈 Future Enhancements

* Expand Memory to 256×8
* Stack Pointer Support
* CALL and RET Instructions
* UART-Based Program Loading
* Interrupt Handling
* Microcoded Control Unit
* Pipelined Architecture
* Hardware Debug Interface
* Instruction Prefetch Mechanism

---

## 🏆 Learning Outcomes

This project demonstrates practical understanding of:

* Computer Architecture Fundamentals
* Processor Datapath Design
* FSM-Based Control Logic
* FPGA-Based Digital System Design
* Verilog HDL Development
* Memory and Bus Architectures
* RTL Verification and Simulation

---

## 👨‍💻 Development Platform

**FPGA Board:** Spartan-7 Boolean FPGA Board

**Design Language:** Verilog HDL

**EDA Tool:** Xilinx Vivado

**Design Methodology:** Register Transfer Level (RTL)

---

## 📜 Conclusion

This project successfully implements a complete 8-bit computer architecture on FPGA using Verilog HDL. The design demonstrates how instructions are fetched, decoded, and executed through coordinated interaction between memory, registers, ALU, and control logic. The modular architecture enables easy scalability and serves as a strong foundation for advanced processor development.
