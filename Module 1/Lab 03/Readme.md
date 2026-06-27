# Lab 03 – Half Adder

## Aim

To design, simulate, and verify a Half Adder using Verilog HDL in Behavioral, Dataflow, and Gate-Level modeling styles with Verilator and visualize the simulation waveforms using GTKWave.

---

# Theory

A Half Adder is a combinational logic circuit that performs the addition of two single-bit binary inputs.

It produces two outputs:

- **Sum** = XOR of the inputs
- **Carry** = AND of the inputs

Boolean Expressions:

\[
Sum = A \oplus B
\]

\[
Carry = A \cdot B
\]

---

# Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="450">
</p>

---

# Truth Table

<p align="center">
<img src="Images/truth_table.png" width="450">
</p>

---

# Project Structure

```text
Lab 03
│
├── Images
│   ├── block_diagram.png
│   ├── truth_table.png
│   ├── behavioral_terminal.png
│   ├── behavioral_waveform.png
│   ├── dataflow_terminal.png
│   ├── dataflow_waveform.png
│   ├── gatelevel_terminal.png
│   └── gatelevel_waveform.png
│
├── Source_Code
│   ├── half_adder_behavioral.v
│   ├── half_adder_dataflow.v
│   └── half_adder_gatelevel.v
│
├── Testbench
│   ├── half_adder_behavioral_tb.v
│   ├── half_adder_dataflow_tb.v
│   └── half_adder_gatelevel_tb.v
│
├── Waveforms
│   ├── half_adder_behavioral.vcd
│   ├── half_adder_dataflow.vcd
│   └── half_adder_gatelevel.vcd
│
└── README.md
```

---

# RTL Design

The Half Adder is implemented using three different Verilog modeling styles.

### Behavioral Modeling

```
Source_Code/half_adder_behavioral.v
```

### Dataflow Modeling

```
Source_Code/half_adder_dataflow.v
```

### Gate-Level Modeling

```
Source_Code/half_adder_gatelevel.v
```

---

# Testbench

Separate testbenches are created to verify each implementation.

### Behavioral Testbench

```
Testbench/half_adder_behavioral_tb.v
```

### Dataflow Testbench

```
Testbench/half_adder_dataflow_tb.v
```

### Gate-Level Testbench

```
Testbench/half_adder_gatelevel_tb.v
```

Each testbench verifies all possible input combinations.

| A | B | Sum | Carry |
|:-:|:-:|:---:|:-----:|
|0|0|0|0|
|0|1|1|0|
|1|0|1|0|
|1|1|0|1|

---

# Simulation

The project was simulated using **Verilator**.

## Behavioral Model

Compile:

```bash
verilator --binary -j 0 -Wall half_adder_behavioral.v half_adder_behavioral_tb.v \
--top half_adder_behavioral_tb --timing --CFLAGS "-std=c++20" --trace
```

Run:

```bash
./obj_dir/Vhalf_adder_behavioral_tb
```

Open Waveform:

```bash
gtkwave obj_dir/half_adder_behavioral.vcd
```

---

## Dataflow Model

Compile:

```bash
verilator --binary -j 0 -Wall half_adder_dataflow.v half_adder_dataflow_tb.v \
--top half_adder_dataflow_tb --timing --CFLAGS "-std=c++20" --trace
```

Run:

```bash
./obj_dir/Vhalf_adder_dataflow_tb
```

Open Waveform:

```bash
gtkwave obj_dir/half_adder_dataflow.vcd
```

---

## Gate-Level Model

Compile:

```bash
verilator --binary -j 0 -Wall half_adder_gatelevel.v half_adder_gatelevel_tb.v \
--top half_adder_gatelevel_tb --timing --CFLAGS "-std=c++20" --trace
```

Run:

```bash
./obj_dir/Vhalf_adder_gatelevel_tb
```

Open Waveform:

```bash
gtkwave obj_dir/half_adder_gatelevel.vcd
```

---

# Behavioral Model Results

## Terminal Output

<p align="center">
<img src="Images/behavioral_terminal.png" width="700">
</p>

The behavioral implementation correctly generates the Sum and Carry outputs for all input combinations.

---

## Waveform Output

<p align="center">
<img src="Images/behavioral_waveform.png" width="700">
</p>

The GTKWave timing diagram verifies the correct operation of the behavioral Half Adder.

---

# Dataflow Model Results

## Terminal Output

<p align="center">
<img src="Images/dataflow_terminal.png" width="700">
</p>

The dataflow implementation correctly computes the Sum and Carry outputs according to the Half Adder logic.

---

## Waveform Output

<p align="center">
<img src="Images/dataflow_waveform.png" width="700">
</p>

The waveform confirms that the dataflow model functions correctly for all test cases.

---

# Gate-Level Model Results

## Terminal Output

<p align="center">
<img src="Images/gatelevel_terminal.png" width="700">
</p>

The gate-level implementation produces the expected outputs using basic logic gates.

---

## Waveform Output

<p align="center">
<img src="Images/gatelevel_waveform.png" width="700">
</p>

The GTKWave timing diagram confirms the correct operation of the gate-level Half Adder implementation.

---

# Generated Waveform Files

The waveform files generated during simulation are available in:

```
Waveforms/
├── half_adder_behavioral.vcd
├── half_adder_dataflow.vcd
└── half_adder_gatelevel.vcd
```

These VCD files can be opened using GTKWave for waveform analysis.

---

# Applications

- Binary Addition
- Arithmetic Logic Unit (ALU)
- Digital Signal Processing
- Ripple Carry Adders
- FPGA Design
- ASIC Design
- Embedded Digital Systems

---

# Result

The Half Adder was successfully designed using Behavioral, Dataflow, and Gate-Level modeling in Verilog HDL. All three implementations were simulated using Verilator and verified through GTKWave. The simulation outputs matched the expected truth table, confirming the correct functionality of the Half Adder.
