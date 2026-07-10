# Lab 23 – FIFO Design for Asynchronous Interfaces

## Aim

To design, simulate, and verify an **Asynchronous FIFO (First-In First-Out) Buffer** using Verilog HDL for safe data transfer between independent clock domains, and to analyze its operation using Verilator and GTKWave.

---

# Theory

An **Asynchronous FIFO (First-In First-Out)** is a memory buffer used to transfer data safely between two independent clock domains. Unlike synchronous FIFOs, the write and read operations are driven by different clocks, making asynchronous FIFOs an essential component for reliable **Clock Domain Crossing (CDC)**.

The FIFO stores incoming data in sequential memory locations using a **write pointer**, while a **read pointer** retrieves data in the same order. Status flags such as **Full** and **Empty** prevent buffer overflow and underflow, ensuring safe communication between asynchronous hardware modules.

---

# Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="850">
</p>

---

# Applications

- Clock Domain Crossing (CDC)
- High-Speed Communication Interfaces
- UART Communication
- Network Routers
- Processor and Peripheral Interfaces
- FPGA Designs
- ASIC Designs
- System-on-Chip (SoC)

---

# Project Structure

```text
Lab 23
│
├── Images
│   ├── block_diagram.png
│   └── waveform.png
│
├── Scripts
│   └── run.sh
│
├── Source_Code
│   └── fifo.v
│
├── Testbench
│   └── fifo_tb.v
│
├── Waveforms
│   └── dump.vcd
│
└── README.md
```

---

# RTL Design

The RTL implementation consists of a simple asynchronous FIFO.

### fifo.v

The FIFO module includes:

- Independent write and read clock domains.
- 8-depth memory buffer with 8-bit data width.
- Separate write and read pointers.
- Full and Empty status flag generation.
- Independent write and read reset signals.
- Safe storage and retrieval of data between asynchronous clock domains.

---

# Testbench

The testbench performs the following operations:

- Generates independent write and read clocks.
- Applies separate reset signals.
- Writes multiple data values into the FIFO.
- Reads the stored data after writing is complete.
- Generates waveform data into `dump.vcd`.
- Verifies FIFO operation under asynchronous clock conditions.

---

# Simulation Procedure

## Compilation

```bash
verilator --binary -j 0 -Wall fifo.v fifo_tb.v \
--top fifo_tb --timing --CFLAGS "-std=c++20" --trace
```

---

## Execution

```bash
./obj_dir/Vfifo_tb
```

---

## Waveform Generation

Open the generated waveform using GTKWave.

```bash
gtkwave Waveforms/dump.vcd
```

> If the VCD file is generated inside `obj_dir`, use:

```bash
gtkwave obj_dir/dump.vcd
```

---

# Waveform Output

<p align="center">
<img src="Images/waveform.png" width="900">
</p>

### Waveform Observation

The GTKWave simulation verifies the correct operation of the asynchronous FIFO.

- **wr_clk** continuously drives write operations.
- **rd_clk** independently controls read operations at a different frequency.
- **wr_data** is written into FIFO memory whenever **wr_en** is asserted.
- **rd_data** retrieves the stored values after read enable is activated.
- **wr_full** becomes active when the FIFO reaches maximum capacity, preventing further writes.
- **rd_empty** indicates when no data is available for reading.
- The waveform confirms successful data transfer between two independent clock domains without overflow or underflow.

---

# Generated Waveform File

The generated VCD waveform file is available in:

```text
Waveforms/dump.vcd
```

This waveform can be viewed using GTKWave for detailed timing analysis.

---

# Applications

- Clock Domain Crossing (CDC)
- FIFO-Based Communication Systems
- UART Buffers
- DMA Controllers
- Processor-to-Peripheral Interfaces
- FPGA Designs
- ASIC Designs
- High-Speed Embedded Systems

---

# Result

The asynchronous FIFO was successfully designed and verified using Verilog HDL. Simulation with Verilator and waveform analysis using GTKWave confirmed reliable data transfer between independent write and read clock domains. The Full and Empty status flags correctly prevented overflow and underflow conditions, demonstrating the effectiveness of asynchronous FIFOs for safe Clock Domain Crossing (CDC) in modern digital systems.
