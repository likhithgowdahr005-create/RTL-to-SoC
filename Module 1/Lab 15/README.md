# Lab 15 – Implementation of Simple Timer IP

## Aim

To design, implement, and verify a parameterized **Simple Timer IP** using Verilog HDL. The timer is simulated using Verilator and analyzed using GTKWave to understand countdown operation, timer control, and completion signaling.

---

## Theory

A Timer IP (Intellectual Property) is one of the most commonly used hardware blocks in digital systems. It provides accurate timing control for applications such as task scheduling, watchdog timers, communication protocols, and embedded systems.

The implemented timer operates as a programmable countdown timer. When the **start** signal is asserted, the timer loads a preset value and decrements the counter on every rising edge of the clock. Once the counter reaches zero, the timer stops and asserts the **done** signal, indicating successful completion of the countdown.

The design is parameterized, allowing the counter width to be modified for different timing requirements.

---

## Block Diagram

<p align="center">
<img src="Images/block_diagram.png" width="650">
</p>

---

## Applications

- Embedded Systems
- FPGA Design
- ASIC Design
- Real-Time Operating Systems (RTOS)
- Communication Protocol Timeouts
- Watchdog Timers
- PWM Controllers
- Event Scheduling
- Delay Generation

---

## Project Structure

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

## RTL Design

The Timer IP consists of the following functional blocks:

- **Counter Register**
  - Stores the current countdown value.

- **Load Value Register**
  - Holds the initial countdown value.

- **Running Flag**
  - Indicates whether the timer is currently active.

- **Start Control**
  - Loads the preset value and begins the countdown.

- **Done Signal**
  - Becomes high after the counter reaches zero.

The timer loads the programmed value when the **start** signal is asserted and decrements the counter on every clock cycle until completion.

---

## Testbench

The testbench performs the following operations:

- Generates a 10 ns system clock.
- Applies a synchronous reset.
- Loads an initial timer value.
- Starts the countdown timer.
- Waits until the timer completes.
- Starts another countdown using a different load value.
- Dumps simulation data into **simple_timer.vcd**.
- Verifies correct timer operation using GTKWave.

---

## Running the Simulation

Execute the simulation using:

```bash
chmod +x Scripts/run.sh
./Scripts/run.sh
```

The script automatically:

- Compiles the RTL using Verilator
- Builds the simulation executable
- Executes the testbench
- Generates **simple_timer.vcd**
- Opens GTKWave

---

## Waveform Output

<p align="center">
<img src="Images/waveform.png" width="900">
</p>

### Waveform Observation

The waveform verifies the expected operation of the Timer IP.

- The **rst** signal initializes the timer.
- The **start** signal loads the preset value into the counter.
- The **count** register decrements on every clock cycle.
- The **running** signal remains high while the timer is active.
- The **done** signal is asserted after the countdown reaches zero.
- The timer successfully performs multiple countdown operations using different load values.

---

## Generated Waveform File

```text
Waveforms/simple_timer.vcd
```

---

## Applications

- Digital Timing Control
- Embedded Controllers
- FPGA Designs
- ASIC Development
- Watchdog Timers
- Communication Protocol Timing
- PWM Generation
- Real-Time Scheduling

---

## Result

The implementation and simulation of the **Simple Timer IP** were successfully completed using Verilog HDL. The generated waveform verified correct loading of the preset value, countdown operation, and assertion of the **done** signal upon timer completion. The design demonstrates the fundamental operation of a programmable timer IP and its practical use in FPGA, ASIC, and embedded system applications.
