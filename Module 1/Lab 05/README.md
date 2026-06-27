# Lab 05 – 4-Bit Up Counter

## Aim

To design, simulate, and verify a 4-bit synchronous Up Counter using Verilog HDL, simulate it using Verilator, and analyze the waveform using GTKWave.

---

# Theory

A 4-bit Up Counter is a sequential digital circuit that increments its binary output by one on every positive edge of the clock signal.

The counter counts from:

```
0000 (0)
      ↓
0001 (1)
      ↓
0010 (2)
      ↓
...
1111 (15)
      ↓
0000 (0)
```

Since the counter is 4 bits wide, it has **16 counting states (0–15)**. After reaching **1111**, it automatically wraps back to **0000**. An asynchronous reset initializes the counter to **0000** whenever the reset signal is asserted.

---

# Counter Operation

Next Count = Current Count + 1

---

# Block Diagram

<p align="center">
<img src="./Images/block_diagram.png" width="600">
</p>

---

# Truth Table

<p align="center">
<img src="./Images/truth_table.png" width="700">
</p>

---

# Project Structure

```
Lab 05
│
├── Images
│   ├── block_diagram.png
│   ├── truth_table.png
│   ├── terminal_output.png
│   └── waveform.png
│
├── Source_Code
│   └── up_counter_4bit.v
│
├── Testbench
│   └── up_counter_4bit_tb.v
│
├── Waveforms
│   └── up_counter_4bit.vcd
│
└── README.md
```

---

# RTL Design

The RTL design file is available in:

```
Source_Code/up_counter_4bit.v
```

The design implements a **4-bit synchronous Up Counter** with an asynchronous reset. On every positive edge of the clock, the counter increments by one. When reset is asserted, the counter immediately returns to **0000**.

---

# Testbench

The testbench is available in:

```
Testbench/up_counter_4bit_tb.v
```

The testbench performs the following operations:

- Generates a periodic clock signal
- Applies an asynchronous reset
- Releases the reset
- Observes the counter increment from 0 to 15
- Verifies wrap-around from 1111 to 0000
- Dumps waveform data into a VCD file

---

# Simulation

The project was simulated using **Verilator**.

Compilation command:

```bash
verilator --binary -j 0 -Wall up_counter_4bit.v up_counter_4bit_tb.v \
--top up_counter_tb --timing --CFLAGS "-std=c++20" --trace
```

Run the simulation:

```bash
./obj_dir/Vup_counter_tb
```

---

# Terminal Output

<p align="center">
<img src="./Images/terminal_output.png" width="800">
</p>

The terminal output confirms that the counter initializes to **0000** after reset and increments sequentially from **0000** to **1111**, then wraps around to **0000**, demonstrating correct counting behavior.

---

# Waveform Generation

Generate the waveform during simulation using:

```verilog
$dumpfile("up_counter_4bit.vcd");
$dumpvars();
```

Open the waveform using GTKWave:

```bash
gtkwave up_counter_4bit.vcd
```

---

# Waveform Output

<p align="center">
<img src="./Images/waveform.png" width="800">
</p>

The GTKWave timing diagram shows:

- Clock signal transitions
- Reset initialization
- Sequential counting from **0** to **15**
- Automatic rollover back to **0**

The waveform verifies the correct functionality of the 4-bit Up Counter.

---

# Generated Waveform File

The waveform generated during simulation is available in:

```
Waveforms/up_counter_4bit.vcd
```

This VCD file can be opened using GTKWave for timing analysis and signal verification.

---

# Applications

- Digital Counters
- Event Counters
- Frequency Dividers
- Digital Clocks
- Timers
- Control Units
- Sequence Generators
- FPGA and ASIC Designs

---

# Result

The **4-bit Up Counter** was successfully designed using Verilog HDL, simulated using Verilator, and verified using GTKWave. The counter correctly incremented from **0000** to **1111**, wrapped back to **0000**, and responded correctly to the asynchronous reset signal, confirming the expected functionality.
