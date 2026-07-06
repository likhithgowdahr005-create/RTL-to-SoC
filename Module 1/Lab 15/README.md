# Lab 15 – Implementation of Simple Timer IP

## Aim

To design, simulate, and verify a parameterized **Simple Timer IP** using Verilog HDL with Verilator and analyze its timing behavior using GTKWave.

---

# Theory

A Timer IP (Intellectual Property) is a reusable digital hardware module that provides accurate timing and delay generation in digital systems. It is widely used in microcontrollers, System-on-Chip (SoC) designs, embedded systems, communication protocols, watchdog timers, and real-time operating systems.

The timer implemented in this lab is a **programmable countdown timer**. When the **start** signal is asserted, the timer loads a user-defined value into the counter and begins decrementing the count on every positive edge of the clock. Once the counter reaches zero, the timer stops automatically and asserts the **done** signal, indicating that the countdown has completed.

The design is parameterized using the **WIDTH** parameter, making it reusable for timers of different bit widths.

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

# RTL Design File

The Verilog HDL design is available in:

```text
Source_Code/simple_timer.v
```

The design implements a parameterized countdown timer consisting of:

- Counter Register
- Load Value Register
- Running Flag
- Start Control Logic
- Done Signal

The timer loads the preset value when the **start** signal is asserted and decrements the counter on every rising edge of the clock. Once the counter reaches zero, the timer stops and asserts the **done** signal.

---

# Testbench File

The corresponding testbench is available in:

```text
Testbench/simple_timer_tb.v
```

The testbench performs the following operations:

- Generates the system clock.
- Applies synchronous reset.
- Loads a countdown value of **5**.
- Starts the timer.
- Waits until completion.
- Loads another countdown value of **3**.
- Starts the timer again.
- Generates the waveform file for GTKWave analysis.

This verifies multiple countdown operations within a single simulation.

---

# Simulation Procedure

## Compilation

The project is compiled using the provided simulation script.

```bash
chmod +x Scripts/run.sh
./Scripts/run.sh
```

The script automatically performs the following operations:

- Compiles the RTL using Verilator.
- Builds the simulation executable.
- Executes the testbench.
- Generates the waveform file.
- Opens GTKWave.

---

## Manual Compilation (Optional)

```bash
verilator --binary -j 0 -Wall simple_timer.v simple_timer_tb.v \
--top simple_timer_tb --timing \
--CFLAGS "-std=c++20 -fcoroutines" --trace
```

---

## Execution

```bash
./obj_dir/Vsimple_timer_tb
```

---

## Waveform Generation

Open the generated waveform using GTKWave.

```bash
gtkwave Waveforms/simple_timer.vcd
```

> If the waveform is generated inside `obj_dir`, use:

```bash
gtkwave obj_dir/simple_timer.vcd
```

---

# Waveform Output

<p align="center">
<img src="Images/waveform.png" width="900">
</p>

The waveform confirms the correct functionality of the Simple Timer IP.

### Waveform Observation

- The **clk** signal provides the timing reference for all operations.
- The **rst** signal initializes the timer and clears internal registers.
- The **load_val** input loads the preset countdown value.
- The **start** signal begins the countdown operation.
- The internal **count** register decrements on every positive edge of the clock.
- The **running** signal remains HIGH while the timer is active.
- Once the counter reaches zero, the **done** signal is asserted and the timer stops.
- The timer successfully reloads and performs multiple countdown operations using different preset values.

The waveform verifies correct timer initialization, countdown operation, and completion signaling.

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
- Watchdog Timers
- Communication Protocol Timeouts
- PWM Controllers
- Event Scheduling
- Delay Generation
- Timing Control in SoC Designs

---

# Result

The **Simple Timer IP** was successfully designed using Verilog HDL, simulated using Verilator, and verified using GTKWave. The simulation results confirmed correct loading of the preset value, countdown operation, assertion of the **done** signal upon timer completion, and successful execution of multiple timer cycles. The generated waveform matched the expected behavior, validating the functionality of the programmable countdown timer.
