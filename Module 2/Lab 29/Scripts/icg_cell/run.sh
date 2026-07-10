#!/bin/bash
#1: Run Verilator to compile and genrate simulation files
verilator --binary -j 0 -Wall icg_cell_model.v icg_cell_model_tb.v --top icg_cell_model_tb --timing --CFLAGS "-std=c++20" --trace
#2 : Navigate to the object directory
cd obj_dir || { echo "obj_dir not found"; exit 1; }
#3: Compile the simualtion binary
make -f Vicg_cell_model_tb.mk Vicg_cell_model_tb || { echo "Compilation failed"; exit 1; }
#4: Run the simulation
./Vicg_cell_model_tb || { echo "Simulation failed"; exit 1; }
#5: Open the waveform in GTKWave
gtkwave icg_cell_model.vcd

