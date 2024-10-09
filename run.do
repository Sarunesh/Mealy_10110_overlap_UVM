# Functional coverage
vlib work
vlog +incdir+D:/Sarunesh/Projects/UVM/LRM/uvm-1.2/uvm-1.2/src list.svh
vsim -novopt -suppress 12110 top \
-sv_lib D:/Sarunesh/Software/Questasim_10.7/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+UVM_TESTNAME=test_n_random \
+UVM_VERBOSITY=UVM_HIGH
#add wave -position insertpoint sim:/top/pif/*
do wave.do
run -all
