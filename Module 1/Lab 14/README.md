# Lab 14 – Exploring Reset Types in Digital Design

## Overview

This lab demonstrates different reset mechanisms used in digital systems using Verilog HDL. Four commonly used reset techniques are implemented and simulated using Verilator, while GTKWave is used to verify their behavior through waveform analysis.

The reset types covered in this lab are:

- Asynchronous Reset
- Synchronous Reset
- Global Reset
- Domain-Specific Reset

---

## Folder Structure

```
Lab 14/
│── Asynchronous_Reset/
│   ├── Images/
│   │   ├── block_diagram.png
│   │   └── waveform.png
│   ├── Scripts/
│   │   └── run.sh
│   ├── Source_Code/
│   │   └── async_reset_ff.v
│   ├── Testbench/
│   │   └── async_reset_tb.v
│   └── Waveforms/
│       └── async_reset.vcd
│
│── Synchronous_Reset/
│   ├── Images/
│   │   ├── block_diagram.png
│   │   └── waveform.png
│   ├── Scripts/
│   │   └── run.sh
│   ├── Source_Code/
│   │   └── sync_reset_ff.v
│   ├── Testbench/
│   │   └── sync_reset_tb.v
│   └── Waveforms/
│       └── sync_reset.vcd
│
│── Global_Reset/
│   ├── Images/
│   │   ├── block_diagram.png
│   │   └── waveform.png
│   ├── Scripts/
│   │   └── run.sh
│   ├── Source_Code/
│   │   └── global_reset.v
│   ├── Testbench/
│   │   └── global_reset_tb.v
│   └── Waveforms/
│       └── global_reset.vcd
│
│── Domain_Specific_Reset/
│   ├── Images/
│   │   ├── block_diagram.png
│   │   └── waveform.png
│   ├── Scripts/
│   │   └── run.sh
│   ├── Source_Code/
│   │   └── domain_reset.v
│   ├── Testbench/
│   │   └── domain_reset_tb.v
│   └── Waveforms/
│       └── domain_reset.vcd
│
└── README.md
```

---

# Reset Types Covered

| Reset Type | Clock Dependent | Purpose |
|------------|-----------------|---------|
| Asynchronous Reset | No | Immediate reset regardless of clock |
| Synchronous Reset | Yes | Reset only on active clock edge |
| Global Reset | Yes | Reset multiple modules simultaneously |
| Domain-Specific Reset | Yes | Independent reset for different clock domains |

---

# 1. Asynchronous Reset

## Description

An asynchronous reset immediately clears the flip-flop output whenever the reset signal becomes active, without waiting for a clock edge.

### Block Diagram

```
Images/block_diagram.png
```

### RTL Design

```
Source_Code/async_reset_ff.v
```

### Testbench

```
Testbench/async_reset_tb.v
```

### Simulation Script

```
Scripts/run.sh
```

### Output Waveform

```
Images/waveform.png
```

### Observations

- Reset is independent of the clock.
- Output changes immediately after reset assertion.
- Commonly used for power-on initialization and emergency reset.

---

# 2. Synchronous Reset

## Description

A synchronous reset only affects the flip-flop output during the active edge of the clock.

### Block Diagram

```
Images/block_diagram.png
```

### RTL Design

```
Source_Code/sync_reset_ff.v
```

### Testbench

```
Testbench/sync_reset_tb.v
```

### Simulation Script

```
Scripts/run.sh
```

### Output Waveform

```
Images/waveform.png
```

### Observations

- Reset occurs only on the rising edge of the clock.
- Provides predictable timing.
- Preferred in FPGA and ASIC designs.

---

# 3. Global Reset

## Description

A single reset signal initializes multiple sequential elements simultaneously.

### Block Diagram

```
Images/block_diagram.png
```

### RTL Design

```
Source_Code/global_reset.v
```

### Testbench

```
Testbench/global_reset_tb.v
```

### Simulation Script

```
Scripts/run.sh
```

### Output Waveform

```
Images/waveform.png
```

### Observations

- One reset controls multiple flip-flops.
- Useful during system startup.
- Ensures all modules begin in a known state.

---

# 4. Domain-Specific Reset

## Description

Each clock domain has an independent reset signal, allowing selective reset of different subsystems.

### Block Diagram

```
Images/block_diagram.png
```

### RTL Design

```
Source_Code/domain_reset.v
```

### Testbench

```
Testbench/domain_reset_tb.v
```

### Simulation Script

```
Scripts/run.sh
```

### Output Waveform

```
Images/waveform.png
```

### Observations

- Each reset signal affects only its corresponding clock domain.
- Enables independent subsystem initialization.
- Widely used in multi-clock SoC architectures.

---

# Tools Used

- Verilog HDL
- Verilator
- GTKWave
- GVim
- Ubuntu (WSL)

---

# Applications

- FPGA Design
- ASIC Design
- SoC Development
- Reset Domain Crossing (RDC)
- Clock Domain Crossing (CDC)
- Embedded Digital Systems
- Processor Initialization

---

# Learning Outcomes

After completing this lab, you will be able to:

- Understand different reset methodologies.
- Differentiate between synchronous and asynchronous reset.
- Implement global and domain-specific reset circuits.
- Simulate Verilog RTL using Verilator.
- Analyze reset behavior using GTKWave.
- Understand reset strategies used in modern digital systems.

---

# Result

Successfully implemented and verified four different reset techniques using Verilog HDL. Simulation results confirmed the expected behavior of asynchronous reset, synchronous reset, global reset, and domain-specific reset through waveform analysis in GTKWave.
