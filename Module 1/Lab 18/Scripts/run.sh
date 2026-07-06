#!/bin/bash
#Step 1: Run Verilator to compile and genrate simulation files
verilator --binary -j 0 -Wall alu.v uart_stub.v soc_top.v soc_tb.v --top soc_tb --timing --CFLAGS "-std=c++20" --trace

#Step 2: Navigate to the object directory 
cd obj_dir || { echo "obj_dir not found"; exit 1; }

#Step 3: Compile the simulation binary
make -f Vsoc_tb.mk Vsoc_tb || { echo "Comiplation failed"; exit 1; }

#Step 4: Run the simulation 
./Vsoc_tb || { echo "Simulation failed"; exit 1; }

#Step 5: Open the waveform in GTKWave
gtkwave soc_debug.vcd

