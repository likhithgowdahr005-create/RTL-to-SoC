#!/bin/bash

#1: Run Verilator to genrate simulation files
verilator --binary -j 0 ff_no_gating.v ff_with_gating.v ff_tb.v --top ff_tb --timing --CFLAGS "-std=c++20" --trace

#2: Move into the object directory 
cd obj_dir || { echo "obj_dir not found"; exit 1; }

#3: Compile the testbench using make
make -Vff_tb.mk Vff_tb || { echo "Compilation failed"; exit1; }

#4: Run the testbench simulation
./Vff_tb || { echo "Simulation failed"; exit 1; }

#5: View the waveform using GTKWave
gtkwave dump.vcd 


