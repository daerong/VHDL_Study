onerror {quit -f}
vlib work
vlog -work work multiplexer.vo
vlog -work work multiplexer.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.multiplexer_vlg_vec_tst
vcd file -direction multiplexer.msim.vcd
vcd add -internal multiplexer_vlg_vec_tst/*
vcd add -internal multiplexer_vlg_vec_tst/i1/*
add wave /*
run -all
