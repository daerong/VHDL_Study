onerror {quit -f}
vlib work
vlog -work work MUX_2x2.vo
vlog -work work MUX_2x2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MUX_2x2_vlg_vec_tst
vcd file -direction MUX_2x2.msim.vcd
vcd add -internal MUX_2x2_vlg_vec_tst/*
vcd add -internal MUX_2x2_vlg_vec_tst/i1/*
add wave /*
run -all
