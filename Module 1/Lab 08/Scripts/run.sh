#!/bin/bash

# Step 1: Compile RTL and Testbench using verilator
verilator --binary -j 0 -Wall uart_receiver.v uart_receiver_tb.v --top uart_receiver_tb --timing --trace --CFLAGS "-std=c++20"

# Step 2: Build directory
cd obj_dir || { echo "Error: obj_dir not found"; exit 1;}

# Step 3: Build simulation executable
make -f Vuart_receiver_tb.mk Vuart_receiver_tb || { echo "Error: Compilation failed"; exit 1;

# Step 4: Run simulation
./Vuart_receiver_tb || {echo "Error: Simulation failed", exit 1; }

# Step 5: Open waveform
cd ..
gtkwave uart_receiver_tb.vcd


