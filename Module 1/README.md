# Module 1 – RTL Design, Verification and SoC Fundamentals

## Overview

Module 1 introduces the fundamentals of Register Transfer Level (RTL) design using **Verilog HDL**. The module focuses on combinational and sequential circuit design, simulation, verification, clock domain crossing techniques, reset strategies, IP development, System-on-Chip (SoC) integration, debugging, and RTL synthesis.

All designs were implemented using **Verilog HDL**, simulated using **Verilator**, verified with **GTKWave**, and synthesized using **Yosys** with the **Sky130 Standard Cell Library**.

---

## Tools Used

- Verilog HDL
- Verilator
- GTKWave
- Yosys
- Sky130 Standard Cell Library
- Graphviz
- Ubuntu (WSL)

---

# Module Contents

| Lab No. | Experiment |
|---------|------------|
| Lab 01 | 2-Input AND Gate |
| Lab 02 | Basic Combinational Logic Circuits |
| Lab 03 | Sequential Logic Design |
| Lab 04 | Counters and Flip-Flops |
| Lab 05 | Finite State Machine (FSM) |
| Lab 06 | UART Receiver |
| Lab 07 | Ripple Counter |
| Lab 08 | APB Timer |
| Lab 09 | APB Slave Interface |
| Lab 10 | APB-UART Interface |
| Lab 11 | Demonstrating Metastability Without Synchronization |
| Lab 12 | Fixing Metastability Using a 2-Stage Synchronizer |
| Lab 13 | Clock Gating |
| Lab 14 | Exploring Reset Types |
| Lab 15 | Simple Timer IP |
| Lab 16 | Integrating Multiple IPs into a Mini SoC |
| Lab 17 | Clock and Reset Synchronization Logic |
| Lab 18 | Debugging SoC Integration |
| Lab 20 | RTL Synthesis using Yosys |

---

# Learning Outcomes

After completing this module, the following concepts were understood:

- Verilog RTL Design
- Combinational Logic Design
- Sequential Logic Design
- Counters and Registers
- UART Communication
- APB Bus Interface
- Clock Domain Crossing (CDC)
- Metastability
- Two-Stage Synchronizers
- Clock Gating
- Reset Methodologies
- Timer IP Design
- SoC Integration
- RTL Debugging
- RTL Synthesis using Yosys
- Technology Mapping using Sky130 Standard Cells

---

# Software Used

| Tool | Purpose |
|------|---------|
| Verilator | RTL Compilation and Simulation |
| GTKWave | Waveform Analysis |
| Yosys | RTL Synthesis |
| Graphviz | RTL Visualization |
| Ubuntu WSL | Development Environment |

---

# Repository Structure

```text
Module 1
│
├── Lab 01
├── Lab 02
├── Lab 03
├── Lab 04
├── Lab 05
├── Lab 06
├── Lab 07
├── Lab 08
├── Lab 09
├── Lab 10
├── Lab 11
├── Lab 12
├── Lab 13
├── Lab 14
├── Lab 15
├── Lab 16
├── Lab 17
├── Lab 18
├── Lab 20
│
└── README.md
```

---

# Skills Developed

- RTL Coding
- Testbench Development
- Functional Verification
- Waveform Analysis
- Bus Interface Design
- IP Development
- SoC Integration
- Digital Debugging
- CDC Verification
- Reset Synchronization
- RTL Synthesis
- Technology Mapping

---

# Result

Module 1 was successfully completed by implementing, simulating, verifying, debugging, and synthesizing a collection of digital hardware designs using open-source EDA tools. The experiments provided practical experience in RTL design methodology, IP development, synchronization techniques, SoC integration, and ASIC-oriented synthesis using the Sky130 standard cell library.
