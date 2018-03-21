onerror {quit -f}
vlib work
vlog -work work nand_gate.vo
vlog -work work nand_gate.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.nand_gate_vlg_vec_tst
vcd file -direction nand_gate.msim.vcd
vcd add -internal nand_gate_vlg_vec_tst/*
vcd add -internal nand_gate_vlg_vec_tst/i1/*
add wave /*
run -all
