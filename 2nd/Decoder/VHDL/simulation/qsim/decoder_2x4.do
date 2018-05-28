onerror {quit -f}
vlib work
vlog -work work decoder_2x4.vo
vlog -work work decoder_2x4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.decoder_2x4_vlg_vec_tst
vcd file -direction decoder_2x4.msim.vcd
vcd add -internal decoder_2x4_vlg_vec_tst/*
vcd add -internal decoder_2x4_vlg_vec_tst/i1/*
add wave /*
run -all