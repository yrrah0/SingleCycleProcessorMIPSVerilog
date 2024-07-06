onerror {quit -f}
vlib work
vlog -work work VeriogSingleCycleMIPS.vo
vlog -work work VeriogSingleCycleMIPS.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ProcessorMIPS_vlg_vec_tst
vcd file -direction VeriogSingleCycleMIPS.msim.vcd
vcd add -internal ProcessorMIPS_vlg_vec_tst/*
vcd add -internal ProcessorMIPS_vlg_vec_tst/i1/*
add wave /*
run -all
