#!/bin/bash
# 1: Run Verilator to compile and genrate simulation files
verilator --binary -j 0 -Wall pos_edge_gating.v pos_latch_gating_tb.v --top pos_latch_gating_tb --timing --CFLAGS "-std=c++20" --trace

#2: Navigate to the object directory
cd obj_dir || { echo "obj_dir not found"; exit 1; }

#3: Compile the simulation binary
make -f Vpos_latch_gating_tb.mk Vpos_latch_gating_tb || { echo "Compilation failed"; exit 1; }

#4: Run the simulation
./Vpos_latch_gating_tb || { echo "Simulation failed"; exit 1; }

#5: Open the waveform in GTKWave
gtkwave pos_latch_gating.vcd

