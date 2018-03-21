onerror {quit -f}
vlib work
vlog -work work nor_gate.vo
vlog -work work nor_gate.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.nor_gate_vlg_vec_tst
vcd file -direction nor_gate.msim.vcd
vcd add -internal nor_gate_vlg_vec_tst/*
vcd add -internal nor_gate_vlg_vec_tst/i1/*
add wave /*
run -all
