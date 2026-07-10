#!/bin/bash 
# 1: Run Verilator to compile and generate simulation files
verilator --binary -j 0 -Wall neg_latch_gating.v neg_latch_gating_tb.v --top neg_latch_gating_tb --timing --CFLAGS "-std=c++20" --trace

# 2: Navigate to the object directory
cd obj_dir || { echo "obj_dir not found"; exit 1; }

# 3: Compile the simulation binary
make -f Vneg_latch_gating_tb.mk Vneg_latch_gating_tb || { echo "Compilation failed"; exit 1; }

# 4: Run the simulation
./Vneg_latch_gating_tb || { echo "Simulation failed"; exit 1; }

#5: Open the waveform in GTKWave
gtkwave neg_latch_gating.vcd


