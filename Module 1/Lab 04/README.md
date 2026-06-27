# Lab 04 – JK Flip-Flop

## Aim

To design, simulate, and verify a JK Flip-Flop with asynchronous preset using Verilog HDL, simulate the design using Verilator, and analyze the waveform using GTKWave.

---

# Theory

A JK Flip-Flop is a versatile sequential logic circuit that combines the functionality of both SR (Set-Reset) and T (Toggle) flip-flops while eliminating the invalid state problem.

The JK Flip-Flop has the following inputs:

- **J (Set Input)**
- **K (Reset Input)**
- **Clock (clk)**
- **Asynchronous Preset (preset)**

and two outputs:

- **Q**
- **Q̅ (Complement of Q)**

The output changes only on the **positive edge of the clock**. When the asynchronous preset is asserted, the output **Q is immediately forced to logic 1**, independent of the clock and input signals.

---

# Characteristic Equation

```text
Q(next) = (J & Q̅) + (K̅ & Q)
```

---

# Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="350">
</p>

---

# Truth Table

<p align="center">
<img src="Images/truth_table.png" width="700">
</p>

---

# Project Structure

```text
Lab 04
│
├── Images
│   ├── block_diagram.png
│   ├── truth_table.png
│   ├── terminal_output.png
│   └── waveform.png
│
├── Source_Code
│   └── jk_ff.v
│
├── Testbench
│   └── jk_ff_tb.v
│
├── Waveforms
│   └── jk_ff_async.vcd
│
└── README.md
```

---

# RTL Design

The JK Flip-Flop is implemented in Verilog HDL using an edge-triggered sequential always block with asynchronous preset.

RTL Design File:

```text
Source_Code/jk_ff.v
```

---

# Testbench

The testbench verifies all operating modes of the JK Flip-Flop including:

- Preset
- Hold
- Reset
- Set
- Toggle

Testbench File:

```text
Testbench/jk_ff_tb.v
```

---

# Functional Verification

| Preset | Clock | J | K | Operation |
|:------:|:-----:|:-:|:-:|-----------|
|1|X|X|X|Preset|
|0|↑|0|0|Hold|
|0|↑|0|1|Reset|
|0|↑|1|0|Set|
|0|↑|1|1|Toggle|

---

# Simulation

The project was simulated using **Verilator**.

## Compile

```bash
verilator --binary -j 0 -Wall jk_ff.v jk_ff_tb.v \
--top jk_ff_tb --timing --CFLAGS "-std=c++20" --trace
```

---

## Run Simulation

```bash
./obj_dir/Vjk_ff_tb
```

---

## View Waveform

```bash
gtkwave obj_dir/jk_ff_async.vcd
```

---

# Terminal Output

<p align="center">
<img src="Images/terminal_output.png" width="750">
</p>

The terminal output verifies all operating modes of the JK Flip-Flop. The simulation demonstrates correct behavior during preset, hold, reset, set, and toggle operations.

---

# Waveform Output

<p align="center">
<img src="Images/waveform.png" width="750">
</p>

The GTKWave timing diagram confirms that:

- Preset forces Q to logic HIGH.
- Hold retains the previous state.
- Reset clears Q to logic LOW.
- Set drives Q to logic HIGH.
- Toggle changes the output state on every positive clock edge when J = K = 1.

The waveform validates the correct sequential behavior of the JK Flip-Flop.

---

# Generated Waveform File

The waveform generated during simulation is available in:

```text
Waveforms/jk_ff_async.vcd
```

This VCD file can be opened using GTKWave for detailed timing analysis.

---

# Applications

- Binary Counters
- Shift Registers
- Frequency Dividers
- Finite State Machines (FSM)
- Memory Elements
- FPGA Design
- ASIC Design
- Sequential Digital Systems

---

# Result

The JK Flip-Flop with asynchronous preset was successfully designed using Verilog HDL, simulated using Verilator, and verified using GTKWave. The simulation results matched the expected truth table, confirming correct operation for preset, hold, reset, set, and toggle conditions.
