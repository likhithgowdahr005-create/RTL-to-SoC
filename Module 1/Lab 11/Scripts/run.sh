#!/bin/bash
#1: Run Verilator to generate simulation files
verilator --binary -j 0 -Wall metastability.v metastability_tb.v --top metastability_tb --timing -CFLAGS "-std=c++20" --trace

#2:Move into the object directory
cd obj_dir || { echo "obj_dir not found"; exit 1 ; }

#3:Compi;e the testbench using make 

make -f Vmetastability_tb.mk Vmetastability_tb || { echo "Compilation failed" ; exit 1; }

#4:Run the testbench simulation 
./Vmetastability_tb || { echo "Simulation failed"; exit 1; }

#5:View the waveform using GTKWave
gtkwave dump.vcd


