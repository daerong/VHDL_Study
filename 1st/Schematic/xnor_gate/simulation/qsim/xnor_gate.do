onerror {quit -f}
vlib work
vlog -work work xnor_gate.vo
vlog -work work xnor_gate.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.xnor_gate_vlg_vec_tst
vcd file -direction xnor_gate.msim.vcd
vcd add -internal xnor_gate_vlg_vec_tst/*
vcd add -internal xnor_gate_vlg_vec_tst/i1/*
add wave /*
run -all
