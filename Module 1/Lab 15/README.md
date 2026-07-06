# Lab 01 – 2-Input AND Gate

## Aim

To design, simulate, and verify a 2-input AND gate using Verilog HDL using Verilator and analyze the waveform using GTKWave.

---

# Theory

An AND gate is a fundamental combinational logic gate that performs the logical AND operation. The output is HIGH (1) only when both input signals are HIGH (1). If any one of the inputs is LOW (0), the output remains LOW (0).

### Boolean Expression

```
Y = A & B
```

---

# Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="350">
</p>

---

# Truth Table

<p align="center">
<img src="Images/truth_table.png" width="450">
</p>

---

# Project Structure

```text
Lab 01
│
├── Images
│   ├── block_diagram.png
│   ├── truth_table.png
│   ├── terminal_output.png
│   └── waveform.png
│
├── Source_Code
│   └── and_gate_design.v
│
├── Testbench
│   └── and_gate_tb.v
│
├── Waveforms
│   └── and_gate_dump.vcd
│
└── README.md
```

---

# RTL Design File

The Verilog HDL design is available in:

```
Source_Code/and_gate_design.v
```

The module implements a 2-input AND gate using a continuous assignment statement.

---

# Testbench File

The corresponding testbench is available in:

```
Testbench/and_gate_tb.v
```

The testbench verifies all possible input combinations of the AND gate.

| A | B | Y |
|:-:|:-:|:-:|
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|

---

# Simulation Procedure

## Compilation

```bash
verilator --binary -j 0 -Wall and_gate_design.v and_gate_tb.v \
--top and_gate_tb --timing --CFLAGS "-std=c++20" --trace
```

---

## Execution

```bash
./obj_dir/Vand_gate_tb
```

---

## Waveform Generation

Open the generated waveform using GTKWave.

```bash
gtkwave Waveforms/and_gate_dump.vcd
```

> If the VCD file is located inside `obj_dir`, use:

```bash
gtkwave obj_dir/and_gate_dump.vcd
```

---

# Terminal Output

<p align="center">
<img src="Images/terminal_output.png" width="750">
</p>

The terminal output confirms the successful execution of the simulation and verifies all possible input combinations of the AND gate.

---

# Waveform Output

<p align="center">
<img src="Images/waveform.png" width="750">
</p>

The waveform generated using GTKWave verifies the correct logical behavior of the AND gate. The output becomes HIGH only when both inputs are HIGH.

---

# Generated Waveform File

The generated VCD waveform file is available in:

```
Waveforms/and_gate_dump.vcd
```

This waveform file can be opened using GTKWave for timing analysis.

---

# Applications

- Digital Logic Design
- Arithmetic Logic Units (ALUs)
- Control Logic
- Combinational Logic Circuits
- FPGA Design
- ASIC Design
- Embedded Systems

---

# Result

The 2-input AND gate was successfully designed using Verilog HDL, simulated using Verilator, and verified using GTKWave. The simulation results and waveform matched the expected truth table, confirming the correct functionality of the design.
