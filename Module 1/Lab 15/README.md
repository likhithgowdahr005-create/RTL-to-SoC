# Lab 15 – Implementation of Simple Timer IP

## Aim

To design, simulate, and verify a **Simple Timer IP** using Verilog HDL with Verilator and analyze its operation using GTKWave.

---

# Theory

A Timer IP (Intellectual Property) is a reusable digital hardware module used to generate accurate timing and delay functions in digital systems. Timer IPs are widely used in microcontrollers, embedded systems, System-on-Chip (SoC) designs, communication protocols, watchdog timers, and real-time operating systems.

The timer implemented in this lab is a **programmable countdown timer**. When the **start** signal is asserted, the timer loads a preset value into its internal counter and begins decrementing the counter on every rising edge of the system clock. Once the counter reaches zero, the timer stops automatically and asserts the **done** signal, indicating successful completion of the countdown operation.

The timer is parameterized using the **WIDTH** parameter, making it reusable for different counter sizes without modifying the RTL code.

---

# Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="500">
</p>

---

# Project Structure

```text
Lab 15
│
├── Images
│   ├── block_diagram.png
│   └── waveform.png
│
├── Scripts
│   └── run.sh
│
├── Source_Code
│   └── simple_timer.v
│
├── Testbench
│   └── simple_timer_tb.v
│
├── Waveforms
│   └── simple_timer.vcd
│
└── README.md
```

---

# RTL Design

The RTL design is available in:

```text
Source_Code/simple_timer.v
```

The module implements a parameterized programmable countdown timer.

The design consists of:

- **Counter Register**
  - Stores the current countdown value.

- **Load Value Register**
  - Loads the preset value whenever the **start** signal is asserted.

- **Running Flag**
  - Indicates whether the timer is currently active.

- **Done Signal**
  - Becomes HIGH when the countdown reaches zero.

The timer begins counting after receiving the **start** signal and decrements the counter on every positive edge of the clock until completion.

---

# Testbench

The testbench is available in:

```text
Testbench/simple_timer_tb.v
```

The testbench verifies the timer by performing the following operations:

- Generates a periodic clock.
- Applies reset.
- Loads an initial timer value of **5**.
- Starts the countdown operation.
- Waits until completion.
- Loads another timer value of **3**.
- Starts the timer again.
- Dumps simulation data into **simple_timer.vcd**.

The testbench verifies multiple countdown operations within a single simulation.

---

# Running the Simulation

Execute the simulation using:

```bash
chmod +x Scripts/run.sh
./Scripts/run.sh
```

The script automatically:

- Compiles the RTL using Verilator.
- Builds the simulation executable.
- Executes the testbench.
- Generates the VCD waveform.
- Opens GTKWave.

---

# Waveform Output

<p align="center">
<img src="Images/waveform.png" width="900">
</p>

### Waveform Observation

The GTKWave timing diagram verifies the correct operation of the Simple Timer IP.

- The **clk** signal drives the timer operation.
- The **rst** signal initializes all internal registers.
- The **load_val** input loads the preset countdown value.
- The **start** signal begins the countdown process.
- The **count** register decrements on every rising edge of the clock.
- The **running** signal remains HIGH while the timer is active.
- The **done** signal is asserted after the countdown reaches zero.
- The timer successfully performs multiple countdown operations using different preset values.

The waveform confirms the expected functionality of the programmable countdown timer.

---

# Generated Waveform File

The generated VCD waveform file is available in:

```text
Waveforms/simple_timer.vcd
```

This waveform file can be opened using GTKWave for timing analysis and functional verification.

---

# Applications

- Embedded Systems
- FPGA Design
- ASIC Design
- Real-Time Operating Systems (RTOS)
- Communication Interfaces
- Watchdog Timers
- PWM Controllers
- Digital Timing Applications

---

# Result

The **Simple Timer IP** was successfully designed using Verilog HDL, simulated using Verilator, and verified using GTKWave. The simulation confirmed correct loading of programmable countdown values, proper countdown operation, assertion of the **done** signal upon completion, and successful restart of the timer with different load values. The generated waveform matched the expected functionality, validating the operation of the Timer IP.
